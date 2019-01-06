class CreateClusters < ActiveRecord::Migration[5.2]
  def change
    create_table :clusters do |t|
      t.string :clustername
      t.text :clusterendpoints
      t.string :clusterstatus
      t.string :clusterusername
      t.string :clusterpassword
      t.belongs_to :account, index: true

      t.timestamps
    end
  end
end
