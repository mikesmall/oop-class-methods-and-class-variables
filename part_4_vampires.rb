class Vampire

  attr_accessor :name, :age, :in_coffin, :drank_blood_today

  @@list_of_vampires = []

  def initialize(name, age)
    @name = name
    @age = age
  end#initialize

  def self.create
    new_vampire = Vampire.new
    @@list_of_vampires << new_vampire
    return new_vampire
  end#@@create

  def self.drink_blood
    @drank_blood_today == true
  end#drink_blood

  def self.go_home
    @in_coffin == true
  end#go_home

  def sunrise
    # removes from the coven any vampires who are out of their coffins or who haven't drank any blood in the last day
    @@list_of_vampires.each do |vampire|
      if vampire.in_coffin == false
        @@list_of_vampires.delete(self)
      elsif vampire.drank_blood_today == false
        @@list_of_vampires.delete(self)
      end#if
    end#each
  end#@@sunrise

  def sunset
    # sets drank_blood_today and in_coffin to false for the entire coven as they go out in search of blood
    @@list_of_vampires.each do
      drank_blood_today == false
      in_coffin == false
    end#each
  end#@@sunset

end#Vampire

# Test outputs

mike = Vampire.create("Mike", 38)
erin = Vampire.create("Erin", 35)
puts @@list_of_vampires
