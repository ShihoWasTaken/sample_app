class AddWatchedMoviesTabletToUsers < ActiveRecord::Migration
  def change
    add_column :users, :watchedMoviesTablet, :integer
  end
end
