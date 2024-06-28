class Project < ApplicationRecord
  belongs_to :project_type
  has_many :images, dependent: :destroy
  has_many_attached :images
  # validates :name, presence: true
  # validate :images_presence
  # validates :name, :description, :project_type, presence: true
  # validates :attribute, presence: true


  def images_presence
    errors.add(:images, "can't be blank") if images.empty?
  end
end
