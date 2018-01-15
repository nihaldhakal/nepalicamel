require 'httparty'
require 'nokogiri'
require 'byebug'
class Scraper
  attr_accessor :parse_page

  def initialize
    url = "https://www.sastodeal.com/sastodeal/pr-fingerlings---interactive-baby-monkey-13655"
    doc = HTTParty.get(url)
    @parse_page ||= Nokogiri::HTML(doc)
  end
  def get_name
    #parse_page.css("#prodDetail div.product-selection.productDisplaySectionRight div.detailLeft h1").children.map &:text
    parse_page.css("#prodDetail").css("div.product-selection.productDisplaySectionRight).css("v.detailLeft h1").children.map &:text
    parse_page.css("#prodDetail").css(".name").css("p").children.map{|node| node.text}.compact
    debugger
    #parse_page.css("#prodDetail > div.product-selection.productDisplaySectionRight > div.detailLeft > h1 > p")
    #item_container.css(".category-product").children.map {|name| name.text}.compact
  end
  def get_image
    item_container.css(".thumbImg").children.map {|imge| imge.text}.compact
  end
  def get_detail
    item_container.css(".prod-detail").children.map {|detail| detail.text }.compact
  end
  def item_container
    parse_page.css(".category-product")
  end
end

scraper = Scraper.new
name = scraper.get_name
puts name
#imges= scraper.get_image
#details=scraper.get_detail

#(0..details.size).each do |index|
#  puts "- - - index: #{index+1}- - -"
#  puts "Name: #{names[index]} |imge: #{imges[index]} |detail: #{details[index]}"
#end
