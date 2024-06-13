class Contact < ApplicationRecord
  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, length: { minimum: 10 }
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 35 }
  validates :message, length: { maximum: 500 }
end
