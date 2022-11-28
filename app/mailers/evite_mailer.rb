class EviteMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url  = 'http://plan4you.herokuapp.com/rsvp'
    mail(to: 'anthonyborremans@hotmail.com', subject: 'Welcome to My Awesome Site')
  end
end
