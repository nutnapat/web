class User < ApplicationRecord
	has_secure_password
	has_one_attached :image
	validates :email , presence: true ,uniqueness: true
	validates :name , presence: true
	validate :image_type

	has_many :follows
	has_many :cartoons, through: :follows

	has_many :comments

	def image_type
		if image.attached? == false
			errors.add(:image,"are missing!")
		end
	end
end
