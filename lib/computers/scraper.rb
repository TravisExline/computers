require 'open-uri'

WEB_COMPUTERS = "https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"

class Computers::Scraper

  def self.scrape
    doc = open(WEB_COMPUTERS)
    parsed_doc = Nokogiri::HTML(doc)
    computer_name = parsed_doc.css("h3")
    computer_name.each do |pc_name|
      Computers::PCs.new(pc_name.text)
    end
  #def self.get_page
  #  @doc = Nokogiri::HTML(open("https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"))
  #end

  #def specs
  #  get_page.css("h3").each do |pc|
  #    PCs.new(pc.text)
  #  end
    #get_page.css("p.specs__container").each do |specs|
    #  specs_array << specs
  end
end
