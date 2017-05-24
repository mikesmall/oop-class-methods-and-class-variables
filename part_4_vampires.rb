class Vampire

  attr_accessor :name, :age, :in_coffin, :drank_blood_today

  @@list_of_vampires = []

  def initialize(name, age, in_coffin, drank_blood_today)
    @name = name
    @age = age
    @in_coffin =
    @drank_blood_today =
  end#initialize

  def self.create
    new_vampire = Vampire.new(name, age, in_coffin, drank_blood_today)
    @@list_of_vampires << new_vampire
    return new_vampire
  end#@@create

  def self.drink_blood
    @drank_blood_today = true
  end#drink_blood

  def self.go_home
    @in_coffin = true
  end#go_home

  def @@sunrise
    # removes from the coven any vampires who are out of their coffins or who haven't drank any blood in the last day
  end#@@sunrise

  def @@sunset
    # sets drank_blood_today and in_coffin to false for the entire coven as they go out in search of blood
  end#@@sunset


end#Vampire
