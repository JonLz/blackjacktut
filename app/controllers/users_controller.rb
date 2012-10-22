class UsersController < ApplicationController
 
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
     redirect_to "https://www.google.co.nz/" if @user.save
     render 'new' unless @user.save    
  end
end