class CreateSchoolTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :school_teachers do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.boolean :attachment, default: false

      t.timestamps
    end
  end
end
