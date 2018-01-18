class AddNotificationThresholdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :notification_threshold, :float
  end
end
