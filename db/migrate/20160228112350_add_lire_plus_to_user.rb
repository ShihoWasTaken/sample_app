class AddLirePlusToUser < ActiveRecord::Migration
  def change
    add_column :users, :lirePlus, :boolean
  end
end
