class ProjectType < ApplicationRecord
  has_many_attached :images
  has_many :projects
  has_many :projects, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
