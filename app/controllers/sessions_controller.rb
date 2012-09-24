class SessionsController < ApplicationController
  before_filter :check_current_user, :only => [ :new, :create ]

  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      self.current_user = user
      redirect_to organizations_path, :notice => "Logged in!"
    else
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to root_path, :notice => "Logged out!"
  end

end
