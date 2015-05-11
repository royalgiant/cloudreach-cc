require "rails_helper"

RSpec.feature "Contacts", :type => :feature do
  	subject { page }

  	scenario "Index - Gives a no contacts" do
  		visit "contacts"
  		expect(page).to have_title('Contact List')
    	expect(page).to have_content('There are no contacts')
    	expect(page).to have_selector('h2')
  	end

  	scenario "Index - Gives a list of contacts" do
  		@contact = FactoryGirl.create(:contact)
  		visit "contacts"
  		expect(page).to have_title('Contact List')
    	expect(page).to have_content('List of all Contacts')
    	expect(page).to have_selector('h2')
  	end

	scenario "New - Create a contact - success" do
	    visit "/contacts/new"
	    fill_in "First Name", 		:with => "Donald"
	    fill_in "Last Name", 		:with => "Lee"
	    fill_in "Address 1", 		:with => "1234 Fake Street"
	    fill_in "Address 2", 		:with => "Unit 95B"
	    fill_in "City",				:with => "Vancouver"
	    fill_in "Postal Code",		:with => "T4M 5R4"
	    select('Canada', :from => 'contact_typ_countries_id')
	    select('British Columbia', :from => 'contact_typ_regions_id')
	    fill_in "Email Address",	:with => "donald@lee.com"
	    select('Work', :from => 'contact_email_addresses_attributes_0_email_type')
	    fill_in "Telephone number (i.e. 2341234356)", :with => "5192341047"
	    select('Work', :from => 'contact_telephone_numbers_attributes_0_telephone_type')
	    click_button "Create Contact"
	    expect(page).to have_text("Contact created successfully!")
	end

	scenario "New - Create a contact - failed" do
	    visit "/contacts/new"
	    fill_in "First Name", 		:with => "Donald"
	    fill_in "Last Name", 		:with => "Lee"
	    fill_in "Address 1", 		:with => "1234 Fake Street"
	    fill_in "Address 2", 		:with => "Unit 95B"
	    fill_in "City",				:with => "Vancouver"
	    fill_in "Postal Code",		:with => "T4M 5R4"
	    select('Canada', :from => 'contact_typ_countries_id')
	    select('British Columbia', :from => 'contact_typ_regions_id')
	    fill_in "Email Address",	:with => "donald@lee.com"
	    select('Work', :from => 'contact_email_addresses_attributes_0_email_type')
	    fill_in "Telephone number (i.e. 2341234356)", :with => "5adsfn192341047"
	    select('Work', :from => 'contact_telephone_numbers_attributes_0_telephone_type')
	    click_button "Create Contact"
	    expect(page).to have_text("All fields must be filled in correctly!")
	end
end