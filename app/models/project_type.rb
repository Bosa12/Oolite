class ProjectType < ApplicationRecord
  has_many_attached :images
  has_many :projects
  has_many :projects, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  private

  def images_presence
    errors.add(:images, "can't be blank") if images.empty?
  end
end
