module Resources
  class ResourcesIndex < ApplicationService
    attr_accessor :params, :current_ability, :search_results

    def initialize(params, current_ability)
      self.params = params
      self.current_ability = current_ability
    end

    def index
      if params[:search].present? and params[:search].size.positive?
        return search
      end


      Resource.all.accessible_by(current_ability)
    end

    def search
      Resource
          .accessible_by(current_ability)
          .where('LOWER(url) LIKE LOWER(?) ' \
                   'OR LOWER(status) LIKE LOWER(?)',
                 "%#{params[:search]}%",
                 "%#{params[:search]}%")
    end
  end
end
