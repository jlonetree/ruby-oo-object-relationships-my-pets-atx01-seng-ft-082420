require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []
  @@pets
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    #removes everything from the array (www.geekforgeeks.org/ruby-clear-function)
    self.all.clear  
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def buy_cat(name)
    c = Cat.new(name, self)
  end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy"
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_dog(name)
    d = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = "happy"
    end
  end
  
  def sell_pets
    pets = cats + dogs
    pets.select do |pets|
      pets.mood = "nervous"
      pets.owner = nil
      #binding.pry
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end