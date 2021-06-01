class ChangeTeacherMailToEmail < ActiveRecord::Migration[6.0]
  def change
    rename_column :teachers, :mail, :email
  end
end
