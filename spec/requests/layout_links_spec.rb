require 'rails_helper'

RSpec.describe "LayoutLinks", type: :request do

	before(:each) do
		@base_title = "Gem Le Cine | "
	end
	describe "GET /layout_links" do
		it "devrait trouver une page Accueil a l'adresse '/'" do
			get '/'
			expect(response.body).to include("<title>" + @base_title + "Accueil</title>")
		end
		it "devrait trouver une page Contact a l'adresse '/contact'" do
			get '/contact'
			expect(response.body).to include("<title>" + @base_title + "Contact</title>")
		end
		it "devrait trouver une page A Propos a l'adresse /about'" do
			get '/about'
			expect(response.body).to include("<title>" + @base_title + "A Propos</title>")
		end
		it "devrait trouver une page Aide a l'adresse '/help'" do
			get '/help'
			expect(response.body).to include("<title>" + @base_title + "Aide</title>")
		end
		it "devrait trouver une page Aide a l'adresse '/help'" do
			get '/signup'
			expect(response.body).to include("<title>" + @base_title + "Inscription</title>")
		end
		
		it "devrait avoir le bon lien sur le layout" do
			visit root_path
			click_link "Accueil"
			have_selector "title", @base_title + "Accueil"
			click_link "Contact"
			have_selector "title", @base_title + "Contact"
			click_link "Aide"
			have_selector "title", @base_title + "Aide"
			click_link "Inscription"
			have_selector "title", @base_title + "Inscription"
			click_link "Membres"
			have_selector "title", @base_title + "Membres"
			click_link "Statistiques"
			have_selector "title", @base_title + "Statistiques"
		end
	end
end