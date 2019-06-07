class Computers::PCs
  attr_accessor :name, :cpu, :graphics, :ram, :storage, :brand
  @@all = []

  def initialize(name, cpu, graphics, ram, storage)
    @name = name
    @cpu = cpu
    @graphics = graphics
    @ram = ram
    @storage = storage
    @brand = brand
    @@all << self
  end

  def self.all
    @@all
  end

  def brand_name
    brand.name if brand
  end
end
