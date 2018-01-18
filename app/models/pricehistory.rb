class Pricehistory < ApplicationRecord
  belongs_to :product

  after_create :notify_user_if_needed

  private

  def notify_user_if_needed
    return unless self.product.notification_threshold.present?
    PriceNotifierMailer.notify_price(self.product.user, self.product, self.price)
  end

end

