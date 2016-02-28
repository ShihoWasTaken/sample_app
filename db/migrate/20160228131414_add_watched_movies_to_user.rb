class AddWatchedMoviesToUser < ActiveRecord::Migration
  def change
    add_column :users, :watchedMovies, :integer
  end
end
