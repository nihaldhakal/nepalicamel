require 'httparty'
require 'nokogiri'

class Scrapper
  attr_accessor :parse_page, :time_ran

  def initialize(product_url)
    doc = HTTParty.get(product_url)
    @parse_page ||= Nokogiri::HTML(doc)
  end

  def name
    item_container.css("#prodDetail .detailLeft").children[2].text rescue nil
  end

  def price
    item_container.css("#prodDetail .detailRight .prodAction .mrpPrice").children[1].text.strip().delete("/").delete("-") rescue nil
  end

  def image_url
    item_container.css(".productBigImage a").children.select{|node| node.name == "img"}.first[:src] rescue nil
  end

  def item_container
    parse_page.css("#prodDetail") rescue nil
  end

  def attributes
    {
      name: name,
      price: price,
      image_url: image_url,
    }
  end
end
#prodDetail.productBigImage a

