class TypCountry < ActiveRecord::Base
	has_many :contact
	has_many :typ_region
end
