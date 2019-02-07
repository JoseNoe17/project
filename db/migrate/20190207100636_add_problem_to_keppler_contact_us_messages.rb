class AddProblemToKepplerContactUsMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_contact_us_messages, :problem, :text
  end
end
