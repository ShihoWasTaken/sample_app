class RemoveWatchedMoviesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :watchedMovies, :integer
  end
end
