class Chapter < ApplicationRecord
  belongs_to :cartoon
  has_many_attached :images
  has_many :comments, dependent: :destroy
end
