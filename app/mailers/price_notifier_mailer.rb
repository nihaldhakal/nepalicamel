class PriceNotifierMailer < ApplicationMailer
  def notify_price(user, product, price)
    @user = user
    @product = product
    @price = price
    mail(
      to: user.email,
      subject: "Product price dropped below threshold | (#{@product.name})"
    )
  end
end
