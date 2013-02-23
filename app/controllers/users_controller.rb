class UsersController < ApplicationController

  before_filter :save_login_state, :only => [:new, :create, :login_attempt, :logout]

  def new
    @user = User.new
  end

   def create
     @user = User.new(params[:user])
     if @user.save
        flash[:notice] = "User registred"
        flash[:color]= "valid"
      else
        flash[:notice] = "Wrong details"
        flash[:color]= "invalid"
      end
      render "new"
    end
end
