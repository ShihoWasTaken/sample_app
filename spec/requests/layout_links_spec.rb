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
			click_link "A Propos"
			response.should have_selector('title', :content => "A Propos")
			click_link "Aide"
			response.should have_selector('title', :content => "Aide")
			click_link "Contact"
			response.should have_selector('title', :content => "Contact")
			click_link "Accueil"
			response.should have_selector('title', :content => "Accueil")
			click_link "S'inscrire !"
			response.should have_selector('title', :content => "Inscription")
			click_link "Inscription"
			response.should have_selector('title', :content => "Inscription")
			click_link "Lister Profils"
			response.should have_selector('title', :content => "Profils")
			click_link "Stats"
			response.should have_selector('title', :content => "Statistiques des profils qui aimeraient/n'aimeraient pas lire plus")
		end
	end
end