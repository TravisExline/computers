require 'open-uri'

WEB_COMPUTERS = "https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"

class Computers::Scraper

  def get_page
    Nokogiri::HTML(open("https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"))
  end

  def scrape_specs
    pc_hash = {}
    get_page.css(".text-copy").each do |pc|
      pc_name = pc.css("h3").text #creates a hash with the PC name as the key
      pc[pc_name] = {
        :cpu => pc.css("p.specs__container")
        :graphics =>
        :ram =>
        :storage =>
      } #creates nested hash with each spec as key/specific spec as value
    end
    pc_hash
  end

  def scrape_individual
    get_page.css("p.specs__container").each do |specs|

  end

  def self.scrape
    doc = open(WEB_COMPUTERS)
    parsed_doc = Nokogiri::HTML(doc)
    computer_name = parsed_doc.css("h3")
    computer_name.each do |pc_name|
      Computers::PCs.new(pc_name.text)
      binding.pry
    end
  end

#  def self.scrape_specs
#    doc = open(WEB_COMPUTERS)
#    parsed_doc = Nokogiri::HTML(doc)
#    computer_specs = parsed_doc.css("p.specs__container")
#    computer_specs.each do |pc_specs|
#      Computers::PCs.specs = pc_specs.first.text.to_a("|") #puts individual specs into array
#    end
#  end
end


#specs  => parsed_doc.css("p.specs__container").first.text
