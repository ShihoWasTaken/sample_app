class AddWatchedMoviesTvToUsers < ActiveRecord::Migration
  def change
    add_column :users, :watchedMoviesTV, :integer
  end
end
