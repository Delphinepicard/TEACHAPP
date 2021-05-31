class ChangeTypeOfPhone < ActiveRecord::Migration[6.0]
  def change

    remove_column :directors, :phone
    remove_column :schools, :phone
    remove_column :teachers, :phone

    add_column :directors, :phone, :string
    add_column :schools, :phone, :string
    add_column :teachers, :phone, :string
  end
end
