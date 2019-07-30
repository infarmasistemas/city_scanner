module Logs
  class LogsIndex < ApplicationService
    attr_accessor :params, :search_results

    def initialize(params)
      self.params = params
    end

    def index
      if params[:search].present? and params[:search].size.positive?
        return search
      end

      Log.all
    end

    def search
      Log
          .where('LOWER(response_body) LIKE LOWER(?) ' \
                   'OR LOWER(response_code) LIKE LOWER(?)',
                 "%#{params[:search]}%",
                 "%#{params[:search]}%")
    end
  end
end
