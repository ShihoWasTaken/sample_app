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
#  cvPath                :string
#  watchedMoviesCinema   :integer
#  watchedMoviesTV       :integer
#  watchedMoviesComputer :integer
#  watchedMoviesTablet   :integer
#

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views
  before(:each) do
    @base_title = "Gem Le Cine | "
  end
  describe "GET #new" do
	it "returns http success" do
	  get :new
	  expect(response).to have_http_status(:success)
	end

	# Ici on teste la présence des champs du formulaire
	it "Le formulaire doit avoir un champ nom" do
	  get :new
	  response.body.should have_field("user[nom]")
	end

	it "Le formulaire doit avoir un champ email" do
	  get :new
	  response.body.should have_field("user[email]")
	end

	it "Le formulaire doit avoir un champ date de naissance" do
	  get :new
	  response.body.should have_field("user[birthdate]")
	end

	it "Le formulaire doit avoir un champ films cinema" do
	  get :new
	  response.body.should have_field("user[watchedMoviesCinema]")
	end

	it "Le formulaire doit avoir un champ films tv" do
	  get :new
	  response.body.should have_field("user[watchedMoviesTV]")
	end

	it "Le formulaire doit avoir un champ films pc" do
	  get :new
	  response.body.should have_field("user[watchedMoviesComputer]")
	end

	it "Le formulaire doit avoir un champ films tablette" do
	  get :new
	  response.body.should have_field("user[watchedMoviesTablet]")
	end

	it "Le formulaire doit avoir un champ livres lu" do
	  get :new
	  response.body.should have_field("user[readBooks]")
	end

	it "Le formulaire doit avoir un champ cv" do
	  get :new
	  response.body.should have_field("user[file]")
	end

	it "Le formulaire doit avoir un champ veut lire plus" do
	  get :new
	  response.body.should have_field("user[readMoreBooks]")
	end
  	it "devrait avoir le titre adequat" do
    	get 'new'
    	have_selector "title", @base_title + "Inscription"
    end
  end

  describe "POST 'create'" do
    describe "echec" do
      before(:each) do
        @attr = {
          :nom => "",
          :email => "",
    	}
      end

      it "ne devrait pas creer d'utilisateur" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "devrait avoir le bon titre" do
        post :create, :user => @attr
        have_selector "title", @base_title + "Inscription"
      end

      it "devrait rendre la page 'new'" do
        post :create, :user => @attr
        expect(response).to render_template('new')
      end
    end
  end

  describe "GET 'stats'" do

    it "devrait reussir" do
      get 'stats'
      response.should be_success
    end

  end

end
