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

class User < ActiveRecord::Base
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :nom,	:presence => true,
					:length   => { :maximum => 50 }
	validates :email, 	:presence => true,
						:format   => { :with => email_regex },
						:uniqueness => { :case_sensitive => false }
	validates :birthdate,	:presence => true
	validates :watchedMoviesCinema,	:presence => true
	validates :watchedMoviesTV,	:presence => true
	validates :watchedMoviesComputer,	:presence => true
	validates :watchedMoviesTablet,	:presence => true
	validates :readBooks,	:presence => true
	validates :readMoreBooks,	inclusion: [true, false]
end
