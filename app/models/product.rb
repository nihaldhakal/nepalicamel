class Product < ApplicationRecord
  belongs_to :user
  has_many :pricehistories
  validates_presence_of :name

end
