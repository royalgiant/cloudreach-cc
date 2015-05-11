class ContactsController < ApplicationController

	def index
		@contacts = Contact.paginate(page: params[:page])
	end

	def show
	end

	def new
		@contact = Contact.new
		@contact.email_addresses.build 
		@contact.telephone_numbers.build 
	end

	def create
	end

end
