class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :client
      t.float :total
      t.integer :Quatity

      t.timestamps
    end
  end
end
