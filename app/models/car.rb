class Car < ApplicationRecord
   mount_uploader :image, ImageUploader

	validates :name, :presence => true
	validates :image, :presence => true
	validates :price, :presence => true
	validates :description, :presence => true
	validates :is_featured, :presence => true
	validates :location, :presence => true
	validates :registration_date, :presence => true
	validates :model, :presence => true
	validates :manufacturer, :presence => true
	
end
