class Plane < ApplicationRecord
	has_one :wing
	has_one :gear
	has_one :tail
	has_one :engine
	has_one :fuselage
	belongs_to :category
	belongs_to :user
end
