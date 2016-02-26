# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nom        :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
end
