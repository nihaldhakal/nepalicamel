class AddUserIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :user_id, :integer
    add_index 'products', ['user_id'], :name => 'index_user_id'
  end
end
