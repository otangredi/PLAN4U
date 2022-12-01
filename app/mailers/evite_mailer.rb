class EviteMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @event = params[:event]
    @guest = params[:guest]
    @url = "https://www.plan4you.xyz/events/#{@event.id}/rsvp"
    attachments.inline['plan_for_you_logo.png'] = File.read('app/assets/images/plan_for_you_logo.png')
    mail to: @guest.email, subject: 'Our Happily Even After'
  end
end
