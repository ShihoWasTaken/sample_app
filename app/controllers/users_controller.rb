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
	    redirect_to @user
    else
	    @titre = "Inscription"
	    render 'new'
    end
  end
  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:nom, :email, :birthdate)
  end
end
