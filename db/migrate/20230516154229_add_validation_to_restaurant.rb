class AddValidationToRestaurant < ActiveRecord::Migration[7.0]
  def change
    change_column :restaurants, :name, :string, null: false
    change_column :restaurants, :address, :string, null: false
  end
end
