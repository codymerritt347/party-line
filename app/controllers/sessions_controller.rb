class SessionsController < ApplicationController
  def new
  end

  def create
    session[:email] = params[:email]
    redirect_to '/users'
  end

  def destroy
    session.delete :email
  end
end