class AddWatchedMoviesComputerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :watchedMoviesComputer, :integer
  end
end
