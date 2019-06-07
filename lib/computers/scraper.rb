require 'open-uri'

WEB_COMPUTERS = "https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"

class Computers::Scraper

#  def self.get_page
#    Nokogiri::HTML(open("https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"))
#  end

#  def self.scrape_specs
#    pc_hash = {}
#    get_page.css(".text-copy").each do |pc|
#      pc_name = pc.css("h3").first.text
#      specs_name = pc.css("strong").first.text #creates a hash with the PC name as the key
#      pc_hash[pc_name] = {
#        specs_name => pc.css("p.specs__container").first.text
#      } #creates nested hash with each spec as key/specific spec as value
#    end
#    pc_hash
#  end

  def self.scrape
    doc = open(WEB_COMPUTERS)
    parsed_doc = Nokogiri::HTML(doc)
    computer_name = parsed_doc.css("h3")
    computer_name.each do |pc_name|
      Computers::PCs.new(pc_name.text)
    end
  end
end


#specs  => parsed_doc.css("p.specs__container").first.text
#parsed_doc.css("strong") => STATS KEY!!!!!!
