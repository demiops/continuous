class CreateCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :credentials do |t|
      t.string :cloudkey
      t.string :cloudsecret
      t.text :cloudtoken
      t.string :cloudtype
      t.text :clouddata
      t.belongs_to :account, index: true

      t.timestamps
    end
  end
end
