class Location < ApplicationRecord
	has_one :address, dependent: :destroy

	belongs_to :tripp
	validates_presence_of :name
	def self.category
		['Restaurant', 'Park', 'Hotel', 'Museum', 'Beach', 'Attraction', 'Conference Center']
	end
end