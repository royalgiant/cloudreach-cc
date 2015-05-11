require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  	before {
		@email = EmailAddress.new(email_address: "don@sfu.ca", email_type: "Work")
	}

	describe "when email type is not present" do
		before { @email.email_type = " " }
	    it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @email.email_address = " " }
	    it { should_not be_valid }
	end

	describe "when email format is invalid" do
	    it "should be invalid" do
	      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
	                     foo@bar_baz.com foo@bar+baz.com]
	      addresses.each do |invalid_address|
	        @email.email_address = invalid_address
	        expect(@email).not_to be_valid
	      end
	    end
	end

	describe "when email format is valid" do
	    it "should be valid" do
	      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	      addresses.each do |valid_address|
	        @email.email_address = valid_address
	        expect(@email).to be_valid
	      end
	    end
	end
end
