class Cpu

  attr_accessor :cpu_name
  @@all = []

  def initialize(cpu_name)
    @cpu_name = cpu_name
    @@all << self
  end

  def self.all
    @@all
  end
end
