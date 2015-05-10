class CreateTelephoneNumbers < ActiveRecord::Migration
  def change
    create_table :telephone_numbers do |t|
    	t.string :telephone_number
    	t.string :type
    	t.belongs_to :contact
     	t.timestamps null: false
    end
  end
end
