class UsersController < ApplicationController
  before_filter :check_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      Notifier.welcome(@user).deliver
      self.current_user = @user
      redirect_to organizations_path, :notice => "Signed up!"
    else
      flash.now[:error] = 'There was a problem creating your account'
      render "new"
    end
  end
end
