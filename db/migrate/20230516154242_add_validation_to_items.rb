class AddValidationToItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :name, :string, null: false
    change_column :items, :price, :bigint, null: false
    change_column :items, :callories, :integer, null: false
  end
end
