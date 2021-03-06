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

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @age = ((Date.today - @user.birthdate) / 365).floor
  	@titre = "Profil de " + @user.nom
  end
  def new
  	@user = User.new
  	@titre = "Inscription"
  end
  def create
	  @user = User.new(user_params)
    @titre = "Inscription"
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
      redirect_to user_path(@user, just_created: true)
    else
	    render 'new'
    end
  end
  def index
  	@titre = "Liste des membres"
    @users = User.all
  end
  def downloadCV
    @user = User.find(params[:id])
    data = File.open(Rails.root.join('public', 'uploads', @user.cvPath), 'r')
    send_data data.read, filename: 'CV_' + @user.nom.concat('.pdf'), type: "application/pdf", disposition: 'attachment', stream: 'true', buffer_size: '4096' 
  end

  #Génération d'un pdf contenant la liste de tous les utilisateurs
  def database_dump
    @users = User.all
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Utilisateurs"
      end
    end
  end

  def stats
  	@titre = "Statistiques"
    @users = User.all
    cine = Array.new
    tv = Array.new
    comp = Array.new
    tab = Array.new
    lec = 0
    aimeLire = 0
    aimePasLire = 0
    @users.each do |user|
      cine.push(user.watchedMoviesCinema)
      tv.push(user.watchedMoviesTV)
      comp.push(user.watchedMoviesComputer)
      tab.push(user.watchedMoviesTablet)
      if(user.readBooks > 0)
        lec += 1
      end
      if(user.readMoreBooks)
        aimeLire += 1
      else
        aimePasLire += 1
      end
    end
    # On trie les arrays pour le boxplot et on sépare les nombres avec une virgule
    @cinemaArray = cine.sort.join(',')
    @TVArray = tv.sort.join(',')
    @computerArray = comp.sort.join(',')
    @tabletArray = tab.sort.join(',')
    @lecteurs = (lec.to_f * 100.to_f / @users.count.to_f).round(2)
    @nonLecteurs = ((@users.count - lec).to_f * 100.to_f / @users.count.to_f).round(2)
    @totalLecteurs = lec
    @totalNonLecteurs = @users.count - lec
    @totalUsers = @users.count
    # Pourcentage de gens voulant lire plus ou non
    @aimeLire = aimeLire
    @aimePasLire = aimePasLire
  end

  private

  def user_params
    params.require(:user).permit(:nom, :email, :birthdate, :watchedMoviesCinema, :watchedMoviesTV, :watchedMoviesComputer, :watchedMoviesTablet, :readBooks, :readMoreBooks, :cvPath)
  end
end
