FactoryGirl.define do
  	factory :contact, :class => "Contact" do |f|
	  	f.first_name "Donald"
	  	f.last_name "Lee"
	  	f.address1 "1323 Fake Street"
	  	f.address2 "86B"
	  	f.city "Vancouver"
	  	f.postal_code "V5T 6C7"
	  	
	  	association :typ_country, factory: :typ_country
   		association :typ_region, factory: :typ_region
	end

	factory :typ_country, :class => 'TypCountry' do
	    country "Canada"
	end

	factory :typ_region, :class => 'TypRegion' do
    	name "Alberta"
  	end
end
