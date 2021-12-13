class Cartoon < ApplicationRecord
	TAGS = Genre.all
	DAY = %i[sunday monday tuesday wednesday thursday friday saturday]
	has_many :chapters , dependent: :destroy
	has_one_attached :image

	has_many :follows
	has_many :users, through: :follows
end
