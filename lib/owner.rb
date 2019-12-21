require 'pry'
class Owner

  # attr_accessor :name
  attr_reader :name, :owner
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def species
    @owner = "human"
  end
  
  def say_species
    # "I am a " + species + "."
    "I am a #{species}."
  end
  
  def self.all 
    @@all
  end
  
  def self.count 
    @@all.length 
  end
  
  def self.reset_all 
    @@all.clear
  end
  
  def cats 
    Cat.all.select { |c| c.owner == self }
  end 
  
  def dogs 
    Dog.all.select { |d| d.owner == self }
  end 
  
  def buy_cat(name)
    Cat.new(name, self)
  end 
  
  def buy_dog(name)
    Dog.new(name, self)
  end 
  
  def walk_dogs
    self.dogs.collect { |d| d.mood = "happy"} 
    self.dogs
  end
  
  def feed_cats
    self.cats.collect { |c| c.mood = "happy"} 
    self.cats
  end
  
  def sell_pets
    self.dogs.collect { |d| d.mood = "nervous"} 
    self.cats.collect { |c| c.mood = "nervous"}
    self.dogs.collect { |d| d.owner = nil} 
    self.cats.collect { |c| c.owner = nil}
    self.cats + self.dogs
  end
  
  def list_pets 
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end
  
end