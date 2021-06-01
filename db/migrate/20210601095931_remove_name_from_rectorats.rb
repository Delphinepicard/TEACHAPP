class RemoveNameFromRectorats < ActiveRecord::Migration[6.0]
  def change
    remove_column :rectorats, :name, :string
    add_column :rectorats, :first_name, :string
    add_column :rectorats, :last_name, :string
  end
end
