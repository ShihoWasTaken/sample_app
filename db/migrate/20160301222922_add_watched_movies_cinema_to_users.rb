class AddWatchedMoviesCinemaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :watchedMoviesCinema, :integer
  end
end
