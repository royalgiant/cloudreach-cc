class TypRegion < ActiveRecord::Base
	belongs_to :typ_country, foreign_key: "typ_country_id"
	has_many :org_contacts
end
