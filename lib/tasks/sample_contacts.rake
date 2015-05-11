namespace :db do
	task populate: :environment do

		30.times do |n|
			name = "Contact #{n+1}"
			contact = Contact.create!(
				first_name: name,
				last_name: "type #{n+1}",
				address1: "1234 Fake Avenue",
				address2: "Unit #{n+1}",
				city: "Vancouver",
				postal_code: "V#{n+1}M #{n+1}C#{n+1}",
				typ_country_id: 124,
				typ_region_id: 527
			)
			3.times do |t|
				TelephoneNumber.create!(
					telephone_number: "#{t}#{t+3}#{t+5}#{t+4}#{t+2}#{t+1}#{t+1}#{t+2}#{t+3}#{t+2}",
					telephone_type: "Work",
					contact_id: contact.id
				)
			end

			EmailAddress.create!(
				email_address: "test#{n+1}@sfu.ca",
				email_type: "Work",
				contact_id: contact.id
			)

			EmailAddress.create!(
				email_address: "test#{n+1}@home.ca",
				email_type: "Home",
				contact_id: contact.id
			)
		end
	end
end
