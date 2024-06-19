class Project < ApplicationRecord
  belongs_to :project_type
  has_many :images, dependent: :destroy

  validates :name, presence: true
  validates :name, :description, :project_type, presence: true


  # validates :name, presence: true
  # validates :description, presence: true
  # validates :category, presence: true
  # validates :image, presence: true
end
