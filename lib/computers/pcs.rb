class Computers::PCs
  attr_accessor :name, :cpu, :graphics, :ram, :storage, :price
  @@all = ["comp1", "comp2", "comp3"]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end
