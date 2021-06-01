class RemoveNameFromDirectors < ActiveRecord::Migration[6.0]
  def change
    remove_column :directors, :name, :string
    add_column :directors, :first_name, :string
    add_column :directors, :last_name, :string
  end
end
