FactoryGirl.define do
  factory :contact, :class => "Contact" do |f|
  	f.first_name "Donald"
  	f.last_name "Lee"
  	f.address1 "1323 Fake Street"
  	f.address2 "86B"
  	f.city "Vancouver"
  	f.postal_code "V5T 6C7"   
  end
end
