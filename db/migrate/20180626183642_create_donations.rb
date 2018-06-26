class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.string :donor
      t.date :date_given
      t.decimal :amount

      t.timestamps
    end
  end
end
