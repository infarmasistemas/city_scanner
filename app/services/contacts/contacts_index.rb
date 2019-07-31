module Contacts
  class ContactsIndex < ApplicationService
    attr_accessor :params, :search_results

    def initialize(params)
      self.params = params
    end

    def index
      if params[:search].present? and params[:search].size.positive?
        return search
      end


      Contact.all
    end

    def search
      Contact
          .where('LOWER(address) LIKE LOWER(?) ' \
                   'OR LOWER(stats) LIKE LOWER(?)',
                 "%#{params[:search]}%",
                 "%#{params[:search]}%")
    end
  end
end
