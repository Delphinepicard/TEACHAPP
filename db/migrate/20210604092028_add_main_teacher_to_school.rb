class AddMainTeacherToSchool < ActiveRecord::Migration[6.0]
  def change
    add_reference :classrooms, :main_teacher, null: true, foreign_key: {to_table: :users}

    Classroom.update_all(main_teacher_id: User.first.id)

    change_column_null :classrooms, :main_teacher_id, false
  end
end
