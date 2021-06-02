class AddSpeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :level, :string
    add_column :users, :specification, :string
  end
end
