class AddProductsToPriceHistory < ActiveRecord::Migration[5.0]
  def change
    add_column :pricehistories, :product_id, :integer
    add_index 'pricehistories', ['product_id'], :name => 'index_product_id'
  end
end
