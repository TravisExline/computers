require 'open-uri'
WEB_COMPUTERS = "https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"

class Computers::Brand

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find {|brand| brand.name == name}
  end

  def self.create(name)
    self.new(name).tap {|brand| brand.save}
  end

  def save
    @@all << self
  end

  def self.find_by_index(number)
    @@all[number]
  end

  # def self.scrape_brand
  #   computer_array = []
  #   doc = open(WEB_COMPUTERS)
  #   parsed_doc = Nokogiri::HTML(doc)
  #   computer_name = parsed_doc.css("h3")
  #   computer_name.each do |pc|
  #     computer_array << pc.text.split(". ")[1]
  #   end
  #   computer_array.pop
  #   computer_array.each do |computer|
  #     self.new(computer.split(" ")[0])
  #   end
  # end
  #
  # def add_computer_by_name(name)
  #   computer = Computers::PCs.new(name)
  #   computer.brand = self
  # end

  def computers
    Computers::PCs.all.select {|computer| computer.brand == self}
  end
end
