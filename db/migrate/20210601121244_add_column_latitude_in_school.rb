class AddColumnLatitudeInSchool < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :lat, :float
  end
end
