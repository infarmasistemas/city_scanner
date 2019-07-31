module Logs
  class LogsIndex < ApplicationService
    attr_accessor :params, :current_ability, :search_results

    def initialize(params, current_ability)
      self.params = params
      self.current_ability = current_ability
    end

    def index
      if params[:search].present? and params[:search].size.positive?
        return search
      end

      Log.all.accessible_by(current_ability)
    end

    def search
      Log
          .accessible_by(current_ability)
          .where('LOWER(response_body) LIKE LOWER(?) ' \
                   'OR LOWER(response_code) LIKE LOWER(?)',
                 "%#{params[:search]}%",
                 "%#{params[:search]}%")
    end
  end
end
