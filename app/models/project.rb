class Project < ApplicationRecord
  belongs_to :project_type
  has_many :images, dependent: :destroy
  has_many_attached :images
  
  def images_presence
    errors.add(:images, "can't be blank") if images.empty?
  end
end
