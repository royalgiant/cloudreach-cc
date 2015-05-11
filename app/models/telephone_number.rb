class TelephoneNumber < ActiveRecord::Base
	belongs_to :contact
	validates :telephone_number, presence: true, numericality: true, length: {minimum: 10, maximum: 15}
	validates :type, presence: true

end
