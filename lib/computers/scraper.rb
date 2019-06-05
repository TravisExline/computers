require 'open-uri'

class Computers::Scraper
  def get_page
    Nokogiri::HTML(open("https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"))
  end

  def attributes
  end
end
