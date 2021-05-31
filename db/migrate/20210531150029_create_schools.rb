class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :specification
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
