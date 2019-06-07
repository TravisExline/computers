class Computers::PCs
  attr_accessor :name, :cpu, :graphics, :ram, :storage
  @@all = []

  def initialize(name, cpu, graphics, ram, storage)
    @name = name
    @cpu = cpu
    @graphics = graphics
    @ram = ram
    @storage = storage
    @@all << self
  end

  def self.all
    @@all
  end
end
