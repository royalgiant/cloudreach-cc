class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
    	t.string :email_address
    	t.string :type
    	t.belongs_to :contact
      	t.timestamps null: false
    end
  end
end
