class Product < ApplicationRecord
  belongs_to :user
  has_many :pricehistories

  validates_presence_of :url, :name, :image_url

  attr_accessor :scrapped_attrs

  before_validation :do_initial_scrape
  after_create :update_price_history

  def scrapped_attrs
    @scrapped_attrs ||= Scrapper.new(url).attributes
  end

  def update_price_history
    self.pricehistories.create!(date: Time.current, price: scrapped_attrs[:price])
  end

  def do_initial_scrape
    debugger
    self.name = scrapped_attrs[:name]
    self.image_url = scrapped_attrs[:image_url]
  end

end
