class Contact < ApplicationRecord
  belongs_to :user
  enum status: ['neutral', 'active', 'inactive']
end
