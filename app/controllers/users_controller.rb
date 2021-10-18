class UsersController < ApplicationController
  
  def new
    # render :new - this is implied with rails
  end

  def create
    user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to [:root]
      else
        redirect_to [:sessions, :create]
      end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password_confirmation)
  end

end
