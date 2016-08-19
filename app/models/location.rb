class Location < ApplicationRecord

	has_one :addresses, dependent: :destroy

	belongs_to :tripp




	validates_presence_of :name
end
