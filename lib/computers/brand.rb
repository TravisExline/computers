require 'open-uri'
WEB_COMPUTERS = "https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"

class Computers::Brand

  attr_accessor :name

  @@all = []

  def initialize
    @@all << self
    @computers = []
  end

  def self.all
    @@all
  end

  def self.scrape_brand
    computer_array = []
    doc = open(WEB_COMPUTERS)
    parsed_doc = Nokogiri::HTML(doc)
    computer_name = parsed_doc.css("h3")
    computer_name.each do |pc|
      computer_array << pc.text.split(". ")[1]
    end
    computer_array.pop
    computer_array.each do |computer|
      @@all << computer.split(" ")[0]
    end
  end

  def add_computer(computer)
    @computers << computer
    computer.brand = self
  end

  def add_computer_by_name(name)
    computer = Computers::PCs.new(name)
    computer.brand = self
  end

  def computers
    Computers::PCs.all.select {|computer| computer.brand == self}
  end
end
