class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.date :start_date
      t.date :end_date
      t.references :rectorat, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
