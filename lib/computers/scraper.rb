require 'open-uri'

class Computers::Scraper
  attr_accessor :pc
  attr_reader :doc

  def initialize
    @pc = Computers::PCs.new
  end

  def get_page
    @doc = Nokogiri::HTML(open("https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"))
  end

  def scrape
    scrape_details
    @pc
  end

  def scrape_details
    pc_hash = {}
    doc.css("h3").each {|pc| pc_hash[pc.to_sym] = {}}
  end
end
