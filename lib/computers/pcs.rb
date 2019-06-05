class Computers::PCs
  attr_accessor :name, :cpu, :graphics, :ram, :storage
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end
