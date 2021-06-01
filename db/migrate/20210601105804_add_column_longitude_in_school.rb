class AddColumnLongitudeInSchool < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :long, :float
  end
end
