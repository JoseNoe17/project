class AddProductToKepplerContactUsMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_contact_us_messages, :product, :string
  end
end
