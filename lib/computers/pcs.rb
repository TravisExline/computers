class Computers::PCs
  attr_accessor :name, :cpu, :graphics, :ram, :storage, :specs
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.specs
    @specs
  end
end
