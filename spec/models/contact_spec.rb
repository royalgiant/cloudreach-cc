require 'rails_helper'

RSpec.describe Contact, type: :model do
  	before {
  		@contact = FactoryGirl.create(:contact)
  	}

  	subject { @contact }
end
