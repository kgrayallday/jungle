class SessionsController < ApplicationController
  def new
  end

  # def create
  #   @user = User.find_by_email(params[:email])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to [:root]
  #   else
  #     redirect_to [:sessions, :new]
  #   end
  # end

  def create
    if @user = User.authenticate_with_credentials[:email], params[:password]
      session[:user_id] = @user.id
      redirect_to [:root]
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to [:root]
  end
end
