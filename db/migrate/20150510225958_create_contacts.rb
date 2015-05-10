class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :address1, null: false
    	t.string :address2
    	t.string :city, null: false
    	t.string :postal_code, null: false

    	t.string :avatar
    	t.belongs_to :typ_country
    	t.belongs_to :typ_region
      	t.timestamps null: false
    end
  end
end
