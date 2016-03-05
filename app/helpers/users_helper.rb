# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  nom                   :string
#  email                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  birthdate             :date
#  readMoreBooks         :boolean
#  readBooks             :integer
#  watchedMovies         :integer
#  cvPath                :string
#  watchedMoviesCinema   :integer
#  watchedMoviesTV       :integer
#  watchedMoviesComputer :integer
#  watchedMoviesTablet   :integer
#

module UsersHelper
end
