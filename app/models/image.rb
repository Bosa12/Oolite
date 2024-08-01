class Image < ApplicationRecord
  has_many_attached :images
  has_many :projects, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validate :images_presence

  private

  def images_presence
    errors.add(:images, "can't be blank") if images.empty?
  end
end
