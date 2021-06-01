class AddLevelToClassroom < ActiveRecord::Migration[6.0]
  def change
    add_column :classrooms, :level, :string
  end
end
