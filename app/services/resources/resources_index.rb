module Resources
  class ResourcesIndex < ApplicationService
    attr_accessor :params, :search_results

    def initialize(params)
      self.params = params
    end

    def index
      if params[:search].present? and params[:search].size.positive?
        return search
      end


      Resource.all
    end

    def search
      Resource
          .where('LOWER(url) LIKE LOWER(?) ' \
                   'OR LOWER(status) LIKE LOWER(?)',
                 "%#{params[:search]}%",
                 "%#{params[:search]}%")
    end
  end
end
