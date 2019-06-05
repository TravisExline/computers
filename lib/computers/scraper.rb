require 'open-uri'

class Computers::Scraper
  def self.get_page
    @doc = Nokogiri::HTML(open("https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"))
    binding.pry
  end

  def specs
    pc_hash = {}
    specs = []
    get_page.css("h3").each {|pc| pc_hash[pc.text.to_sym] = {}}
    get_page.css("p.specs__container#text")
  end
end
