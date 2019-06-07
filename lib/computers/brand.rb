class Brand

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @computers = []
  end

  def self.all
    @@all
  end

#  def add_computer(computer)
#    @computers << computer
#    computer.brand = self
#  end

#  def add_computer_by_name(name)
#    computer = Computers::PCs.new(name)
#    computer.brand = self
#  end

#  def computers
#    Computers::PCs.all.selecs {|computer| computer.brand == self}
#  end
end
