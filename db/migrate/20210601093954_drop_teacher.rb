class DropTeacher < ActiveRecord::Migration[6.0]
  def change
    remove_reference :assignments, :teacher
    remove_reference :school_teachers, :teacher
    remove_reference :reviews, :teacher
    drop_table :teachers
    add_reference :assignments, :user
    add_reference :school_teachers, :user
    add_reference :reviews, :user
    rename_table :school_teachers, :school_users
  end
end
