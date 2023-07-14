class Board < ApplicationRecord
  validates :name, :email, :visual, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  serialize :visual, Array
end
