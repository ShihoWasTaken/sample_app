# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  nom           :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  birthdate     :date
#  readMoreBooks :boolean
#

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views
  before(:each) do
    @base_title = "Mon site(helper) | "
  end
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  it "devrait avoir le titre adequat" do
    get 'new'
    have_selector "title", @base_title + "Inscription"
  end

  describe "POST 'create'" do
    describe "echec" do
      before(:each) do
        @attr = { :nom => "", :email => "", :password => "",
        :password_confirmation => "" }
      end

      it "ne devrait pas creer d'utilisateur" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "devrait avoir le bon titre" do
        post :create, :user => @attr
        expect(response).to have_selector("title", :content => "Inscription")
      end

      it "devrait rendre la page 'new'" do
        post :create, :user => @attr
        expect(response).to render_template('new')
      end
    end
  end
end
