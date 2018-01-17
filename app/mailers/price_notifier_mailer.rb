class PriceNotifierMailer < ApplicationMailer
  def notify_price(user, product)
    @text = "Hello there!"
    mail(to: user.email, subject: test_subject)
  end
end
