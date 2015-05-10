require "rails_helper"

RSpec.feature "Contacts", :type => :feature do
  scenario "User creates a contact" do
    visit "/contacts/new"

    fill_in "First Name", 		:with => "Donald"
    fill_in "Last Name", 		:with => "Lee"
    fill_in "Address 1", 		:with => "1234 Fake Street"
    fill_in "Address 2", 		:with => "Unit 95B"
    fill_in "City",				:with => "Toronto"
    select('Canada', from:'org_person_org_contacts_attributes_0_typ_countries_id')
    select('Alberta', from:'org_person_org_contacts_attributes_0_typ_regions_id')
    fill_in "Postal Code",		:with => "T4M 5R4"
    fill_in "Email",			:with => "donald@lee.com"
    fill_in "Email Type"		:with => "Work"
    fill_in "Telephone Number" 	:with => "(519)-234-1047"
    fill_in "Telephone Type"	:with => "Work"
    click_button "Create Widget"

    expect(page).to have_text("Contact was successfully created.")
  end
end