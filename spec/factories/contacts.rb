FactoryGirl.define do
  	factory :contact, :class => "Contact" do |f|
	  	f.first_name "Donald"
	  	f.last_name "Lee"
	  	f.address1 "1323 Fake Street"
	  	f.address2 "86B"
	  	f.city "Vancouver"
	  	f.postal_code "V5T 6C7"
	  	f.typ_country_id "124" 
	  	f.typ_region_id "527" 
	    association :email_addresses, factory: :email_addresses
	    association :telephone_numbers, factory: :telephone_numbers
	    association :typ_region, factory: :typ_region 
	    association :typ_country, factory: :typ_country
	    association :typ_region, factory: :typ_region
	end
end
