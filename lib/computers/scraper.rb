require 'open-uri'

WEB_COMPUTERS = "https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"

class Computers::Scraper

  def self.scrape
  doc = open(WEB_COMPUTERS)
  parsed_doc = Nokogiri::HTML(doc)
  computer_name = parsed_doc.css("h3")
  computer_details = parsed_doc.css(".news-article")
  computer_name.each do |pc_name, cpu, graphics, ram, storage, brand|
    pc_specs = computer_details.css(".specs__container")
    cpu = pc_specs.text.split(" | ")[0]
    graphics = pc_specs.text.split(" | ")[1]
    ram = pc_specs.text.split(" | ")[2]
    storage = pc_specs.text.split(" | ")[3]
    brand = Computers::Brand.find_or_create_by_name(pc_name.text.split(" ")[1])
    new_comp = Computers::PCs.new(pc_name.text, cpu, graphics, ram, storage, brand)
  end
end
end

#computer_details = parsed_doc.css(".specs__container")
#computer_details.text.split(" | ")
#specs  => parsed_doc.css("p.specs__container").first.text
#parsed_doc.css("strong") => STATS KEY!!!!!!
