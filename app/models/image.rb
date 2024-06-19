class Image < ApplicationRecord
  belongs_to :project
  validates :attribute, presence: true
  validates :file, presence: true
end
