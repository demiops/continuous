class CreateCcs < ActiveRecord::Migration[5.2]
  def change
    create_table :ccs do |t|
      t.string :ccnumber
      t.string :ccname
      t.string :ccexp
      t.integer :ccv
      t.belongs_to :account, index: true
      t.timestamps
    end
  end
end
