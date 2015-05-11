class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
    	t.string :email_address, null: false
    	t.string :type, null: false
    	t.belongs_to :contact
      	t.timestamps null: false
    end
  end
end
