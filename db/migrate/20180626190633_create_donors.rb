class CreateDonors < ActiveRecord::Migration[5.1]
  def change
    create_table :donors do |t|
      t.string :name
      t.string :addressline1
      t.string :suburb
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end
