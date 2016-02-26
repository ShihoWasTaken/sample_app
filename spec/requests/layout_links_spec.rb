require 'rails_helper'

RSpec.describe "LayoutLinks", type: :request do

	before(:each) do
		@base_title = "Mon site(helper) | "
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
	end
end