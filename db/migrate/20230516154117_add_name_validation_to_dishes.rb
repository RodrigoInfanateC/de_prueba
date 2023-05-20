class AddNameValidationToDishes < ActiveRecord::Migration[7.0]
  def change
    change_column :dishes, :name, :string, null: false
  end
end
