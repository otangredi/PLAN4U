class EviteMailerPreview < ActionMailer::Preview
  def welcome_email
    EviteMailer.with(user: User.first, event: User.first.events.first).welcome_email
  end
end
