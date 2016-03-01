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

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @age = ((Date.today - @user.birthdate) / 365).floor
  end
  def new
  	@user = User.new
  	@titre = "Inscription"
  end
  def create
	  @user = User.new(user_params)
    if @user.save
       # Si un CV a été uploadé
      if(params[:user][:file] != nil && params[:user][:file] != "")
        # On récupère nom du fichier
        uploaded_io = params[:user][:file]
        # On l'enregistre dans le dossier public/uploads/
        File.open(Rails.root.join('public', 'uploads', @user.id.to_s + ".pdf"), 'wb') do |file|
        file.write(uploaded_io.read)
        # On ajoute le nom du fichier à l'User correspondant
        params[:user][:cvPath] = @user.id.to_s + ".pdf"
        # On actualise les infos de l'User dans la BD
        @user.update_attributes(user_params)
        end
      end
	    redirect_to @user
    else
	    @titre = "Inscription"
	    render 'new'
    end
  end
  def index
    @users = User.all
  end
  def downloadCV
    @user = User.find(params[:id])
    data = File.open(Rails.root.join('public', 'uploads', @user.cvPath), 'r')
    send_data data.read, filename: 'CV_' + @user.nom.concat('.pdf'), type: "application/pdf", disposition: 'attachment', stream: 'true', buffer_size: '4096' 
  end

  #Génération d'un pdf contenant la liste de tous les utilisateurs
  def list_pdf
    @users = User.all
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Utilisateurs"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:nom, :email, :birthdate, :watchedMoviesCinema, :watchedMoviesTV, :watchedMoviesComputer, :watchedMoviesTablet, :readBooks, :readMoreBooks, :cvPath)
  end
end
