class AddReadBooksToUser < ActiveRecord::Migration
  def change
    add_column :users, :readBooks, :integer
  end
end
