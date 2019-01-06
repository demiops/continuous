class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :phone
      t.string :city
      t.string :state
      t.string :country
      t.string :email

      t.timestamps
    end
  end
end
