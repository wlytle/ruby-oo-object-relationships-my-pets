class Owner
  
  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end

  attr_reader :name, :species

  def initialize(name, species="human")
    @name = name
    @species = species
    self.class.all << self
  end

  def say_species
    "I am a #{@species}."
  end
  
  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def all_pets
    self.dogs + self.cats
  end

  def sell_pets
    self.all_pets.each do |pet| 
      pet.owner = nil 
      pet.mood = "nervous" 
    end
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
    
  end

end