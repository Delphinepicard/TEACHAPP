class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :phone
      t.string :mail
      t.boolean :availability

      t.timestamps
    end
  end
end
