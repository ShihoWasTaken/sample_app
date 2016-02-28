class AddCvPathToUser < ActiveRecord::Migration
  def change
    add_column :users, :cvPath, :string
  end
end
