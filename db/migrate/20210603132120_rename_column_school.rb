class RenameColumnSchool < ActiveRecord::Migration[6.0]
  def change
    rename_column :schools, :lat, :latitude
    rename_column :schools, :long, :longitude
  end
end
