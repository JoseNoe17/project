class CreateKepplerCustomersClients < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_customers_clients do |t|
      t.string :title
      t.string :image
      t.integer :position
      t.datetime :deleted_at
    end
  end
end
