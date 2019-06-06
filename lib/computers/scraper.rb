require 'open-uri'

WEB_COMPUTERS = "https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"

class Computers::Scraper

  def self.scrape
    doc = open(WEB_COMPUTERS)
    parsed_doc = Nokogiri::HTML(doc)
    computer_name = parsed_doc.css("h3")
    computer_name.each do |pc_name|
      Computers::PCs.new(pc_name.text)
      binding.pry
    end
  end
end


#specs  => parsed_doc.css("p.specs__container").first.text 
