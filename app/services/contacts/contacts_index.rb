module Contacts
  class ContactsIndex < ApplicationService
    attr_accessor :params, :current_ability, :search_results

    def initialize(params, current_ability)
      self.params = params
      self.current_ability = current_ability
    end

    def index
      if params[:search].present? and params[:search].size.positive?
        return search
      end


      Contact.all.accessible_by(current_ability)
    end

    def search
      Contact
          .accessible_by(current_ability)
          .where('LOWER(address) LIKE LOWER(?)',
                 "%#{params[:search]}%")
    end
  end
end
