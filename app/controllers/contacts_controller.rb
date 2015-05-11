class ContactsController < ApplicationController

	def index
		@contacts = Contact.paginate(page: params[:page], per_page: 10)
	end

	def new
		@contact = Contact.new
		@contact.email_addresses.build 
		@contact.telephone_numbers.build 
	end

	def create
		# Sanitize the params necessary for the data model
		contact_info = {
			first_name: contact_params["first_name"].to_s,
			last_name: contact_params["last_name"].to_s,
			address1: contact_params["address1"].to_s,
			address2: contact_params["address2"].to_s,
			city: contact_params["city"].to_s,
			postal_code: contact_params["postal_code"].to_s,
			typ_country_id: contact_params["typ_countries"]["id"].to_i,
			typ_region_id: contact_params["typ_regions"]["id"].to_s
		}
		# Telephone row sanitization and creation 
		telephone = {telephone_number: contact_params["telephone_numbers_attributes"]["0"]["telephone_number"], 
					telephone_type: contact_params["telephone_numbers_attributes"]["0"]["telephone_type"].to_s}

		# Email row sanitization and creation 
		email = {email_address: contact_params["email_addresses_attributes"]["0"]["email_address"], 
				email_type: contact_params["email_addresses_attributes"]["0"]["email_type"].to_s}

		@contact = Contact.exists?(contact_info)
		if @contact
			create_failed(contact_info, nil, telephone, email)
		else
			begin 
				if @contact = Contact.create!(contact_info) && TelephoneNumber.create!(telephone) && EmailAddress.create!(email)
					TelephoneNumber.update(@contact.id, contact_id: @contact.id)			
					EmailAddress.update(@contact.id, contact_id: @contact.id)	
					@contacts = Contact.paginate(page: params[:page], per_page: 10)
					flash[:success] = "Contact created successfully!"
					render :index	
				end
			rescue Exception => e
				create_failed(contact_info, e, telephone, email)
			end
		end
	end

	def add_email
		begin
			EmailAddress.find_or_create_by!(email_params)
		rescue Exception => e
			flash[:danger] = "Invalid Email Address"
		end 
		flash[:sucess] = "Email succesfully added!"
		@contacts = Contact.paginate(page: params[:page], per_page: 10)
		render :index
	end

	def add_telephone
		begin
			TelephoneNumber.find_or_create_by!(telephone_params)
		rescue Exception => e
			flash[:danger] = "Invalid Telephone Number"
		end 
		flash[:sucess] = "Telephone number succesfully added!"
		@contacts = Contact.paginate(page: params[:page], per_page: 10)
		render :index
	end

	private

	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :address1, :address2, :city, :postal_code, 
			{typ_countries: :id}, {typ_regions: :id}, email_addresses_attributes: [:email_address, :email_type],
			telephone_numbers_attributes: [:telephone_number, :telephone_type])
	end

	def email_params
		params.require(:email_address).permit(:email_address, :email_type, :contact_id)
	end

	def telephone_params
		params.require(:telephone_number).permit(:telephone_number, :telephone_type, :contact_id)
	end

	def create_failed(contact_info, e, telephone, email)
		if !e.blank?
			flash[:danger] = "All fields must be filled in correctly!"
		else
			flash[:warning] = "This contact already exists!"
		end
		@contact = Contact.new(contact_info)
		@contact.email_addresses.build(email) 
		@contact.telephone_numbers.build(telephone) 
		render :new
	end

end
