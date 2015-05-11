require 'rails_helper'

RSpec.describe Contact, type: :model do
  	before {
  		@contact = FactoryGirl.create(:contact)
  	}

  	subject { @contact }

  	it { should belong_to(:typ_country)}
  	it { should belong_to(:typ_region)}

  	it { should have_many(:email_addresses)}
  	it { should have_many(:telephone_numbers)}

  	it { should accept_nested_attributes_for(:email_addresses)}
  	it { should accept_nested_attributes_for(:telephone_numbers)}

  	describe "when typ_country is not present" do
		before { @contact.typ_country_id = " " }
	    it { should_not be_valid }
	end

	describe "when typ_region is not present" do
		before { @contact.typ_region_id = " " }
	    it { should_not be_valid }
	end

	describe "when first name is not present" do
		before { @contact.first_name = " " }
	    it { should_not be_valid }
	end

	describe "when last name is not present" do
		before { @contact.last_name = " " }
	    it { should_not be_valid }
	end

	describe "when address1 is not present" do
		before { @contact.address1 = " " }
	    it { should_not be_valid }
	end

	describe "when city is not present" do
		before { @contact.city = " " }
	    it { should_not be_valid }
	end

	describe "when postal code is not present" do
		before { @contact.postal_code = " " }
	    it { should_not be_valid }
	end


end
