class RemoveLirePlusFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :lirePlus, :boolean
  end
end
