require 'rails_helper'
require 'spec_helper'

RSpec.describe TelephoneNumber, type: :model do

	before {
		@phone = TelephoneNumber.new(telephone_number: 1234567890, telephone_type: "Work")
	}

	subject { @phone }

  	describe "when cell number is between 10 to 15 in length" do
		it { should validate_length_of(:telephone_number).is_at_least(10)}
		it { should validate_length_of(:telephone_number).is_at_most(15)}
	end
end
