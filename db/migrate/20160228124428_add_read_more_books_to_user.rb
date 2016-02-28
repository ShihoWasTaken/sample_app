class AddReadMoreBooksToUser < ActiveRecord::Migration
  def change
    add_column :users, :readMoreBooks, :boolean
  end
end
