class Contact < ActiveRecord::Base
	belongs_to :typ_country, foreign_key: "typ_country_id"
	belongs_to :typ_region, foreign_key: "typ_region_id"
	
	has_many :email_addresses
	has_many :telephone_numbers
	accepts_nested_attributes_for :email_addresses
	accepts_nested_attributes_for :telephone_numbers
	
	validates :typ_country, presence: true
	validates :typ_region, presence: true
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :address1, presence: true
	validates :city, presence: true
	validates :postal_code, presence: true

	
end
