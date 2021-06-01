class AllowNullDirector < ActiveRecord::Migration[6.0]
  def change
    change_column_null :schools, :director_id, true
    remove_column :schools, :updated_at, :datetime
    remove_column :schools, :created_at, :datetime
  end
end
