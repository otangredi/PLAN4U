class EviteMailerPreview < ActionMailer::Preview
  def welcome_email
    EviteMailer.with(user: User.first).welcome_email
  end
end
