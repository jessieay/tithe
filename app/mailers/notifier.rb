class Notifier < ActionMailer::Base
  default :from => "Tithe <welcome@tithe.boon.gl>"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def welcome(user)
    @user = user
    mail( :to => user.email, :subject => "Welcome to Tithe!" )
  end
end

