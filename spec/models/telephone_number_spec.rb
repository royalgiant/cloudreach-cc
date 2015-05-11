require 'rails_helper'
require 'spec_helper'

RSpec.describe TelephoneNumber, type: :model do

	before {
		@phone = TelephoneNumber.new(telephone_number: 1234567890, telephone_type: "Work")
	}

	subject { @phone }

	describe "when telephone number is a number" do
		before { @phone.telephone_number = 5554443333 }
	    it { should be_valid }
	end

	describe "when telephone number not a number" do
		before { @phone.telephone_number = "I AM AWESOME" }
	    it { should_not be_valid }
	end

	describe "when telephone number is not present" do
		before { @phone.telephone_number = " " }
	    it { should_not be_valid }
	end

  	describe "when telephone number is between 10 to 15 in length" do
		it { should validate_length_of(:telephone_number).is_at_least(10)}
		it { should validate_length_of(:telephone_number).is_at_most(15)}
	end

	describe "when telephone type is not present" do
		before { @phone.telephone_type = " " }
	    it { should_not be_valid }
	end
end
