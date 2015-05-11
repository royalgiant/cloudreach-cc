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


	scenario "New - Create a contact" do
	   
	    visit "/contacts/new"

	    fill_in "First Name", 		:with => "Donald"
	    fill_in "Last Name", 		:with => "Lee"
	    fill_in "Address 1", 		:with => "1234 Fake Street"
	    fill_in "Address 2", 		:with => "Unit 95B"
	    fill_in "City",				:with => "Toronto"
	    find_field("contact_typ_countries_id").find("option[value='124']").click
	    select('Alaska', :from => 'contact_typ_regions_id')
	    fill_in "Postal Code",		:with => "T4M 5R4"
	    fill_in "Email",			:with => "donald@lee.com"
	    fill_in "Email Type",		:with => "Work"
	    fill_in "Telephone Number", :with => "(519)-234-1047"
	    fill_in "Telephone Type",	:with => "Work"
	    click_button "Create Contact"
	
	    expect(page).to have_text("Contact created successfully!")
	end
end