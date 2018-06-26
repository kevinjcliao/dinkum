class AddRecipientToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :recipient, :string
  end
end
