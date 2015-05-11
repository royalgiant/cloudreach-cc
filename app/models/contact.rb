class Contact < ActiveRecord::Base
	belongs_to :typ_country, foreign_key: "typ_country_id"
	belongs_to :typ_region, foreign_key: "typ_region_id"
	validates :typ_country, presence: true
	validates :typ_region, presence: true
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :address1, presence: true
	validates :city, presence: true
	validates :postal_code, presence: true

	
end
