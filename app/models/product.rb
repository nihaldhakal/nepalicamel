class Product < ApplicationRecord
  belongs_to :user
  has_many :pricehistories

  validates_presence_of :url, :name, :image_url

  attr_accessor :scrapped_attrs

  before_validation :do_initial_scrape
  after_create :mimic_past_month_price_history_based_on_current_price

  def scrapped_attrs
    @scrapped_attrs ||= Scrapper.new(url).attributes
  end

  def mimic_past_month_price_history_based_on_current_price
    current_date = Time.current.to_date
    current_price = scrapped_attrs[:price].to_i

    days_to_add = 30
    from_date = current_date - days_to_add
    to_date = current_date - 1
    date_range = from_date..to_date

    date_range.each do |date|
      random_deviation = 1 + rand(-5..5) / 100.0
      random_price = current_price * random_deviation
      self.pricehistories.create!(date: date, price: random_price.to_i)
    end

    # Update current price at last to maintain sequential order
    create_price_history_today
  end

  def create_price_history_today
    # Don't update if already updated
    return if self.pricehistories.select{|ph| ph.date == Time.current.to_date}.present?
    self.pricehistories.create!(date: Time.current.to_date, price: scrapped_attrs[:price].to_i)
  end

  def do_initial_scrape
    self.name = scrapped_attrs[:name]
    self.image_url = scrapped_attrs[:image_url]
  end

end
