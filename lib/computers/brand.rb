require 'open-uri'
WEB_COMPUTERS = "https://techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263"

class Computers::Brand

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self unless self.name == name
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

  def computers
    Computers::PCs.all.select {|computer| computer.brand == self}
  end
end
