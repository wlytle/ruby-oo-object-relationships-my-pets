class Cat

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :owner, :mood
  attr_reader :name

  def initialize(name, owner, mood="nervous")
    @name, @owner, @mood = name, owner, mood
    self.class.all << self
  end

end