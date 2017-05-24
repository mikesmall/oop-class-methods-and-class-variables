# rand accepts one number as an argument
# and returns a random number that is less than that argument
# and greater than -1.
# So rand(5) would return a random number between 0 and 4,
# and rand(10) would return a number between 0 and 9.
class Zombie
  # @@horde should start as an empty array and will eventually contain the collection of all zombies.
  @@horde = []
  # @@plague_level should start at 10 and will be used to determine the rate at which new zombies are spawned. This value will increase over time.
  @@plague_level = 10
  ## @@max_speed should be set to 5 and indicates the maximum value for the speed attribute of any zombie. This value won't change.
  @@max_speed = 5
  # @@max_strength should be set to 8 and indicates the maximum value for the strength attribute of any zombie. This value won't change.
  @@max_strength
  # @@default_speed should be set to 1. This value won't change.
  @@default_speed = 1
  # @@default_strength should be set to 3. This value won't change.
  @@default_strength

  def initialize(zombie_speed, zombie_strength)
    # This instance method should take two integer arguments: one for the zombie's speed attribute and one for its strength. If the speed argument is greater than @@max_speed then @@default_speed should be used as the new zombie's speed instead. Similarly, you should check to make sure the strength argument is less than or equal to @@max_strength, otherwise @@default_strength should be used as the new zombie's strength attribute.
    @zombie_speed = zombie_speed
      if @zombie_speed > @@max_speed
        @zombie_speed = @@default_speed
      end#if
    @zombie_strength = zombie_strength
      if @zombie_strength > @@max_strength
        @zombie_strength = @@default_strength
      end#if
  end#initialize

  def self.all
    # This class method should return the value of @@horde.
    @@horde
  end#self.all

  def self.spawn
    # This class method should use @@plague_level to generate a random number
    newly_spawned_zombies = rand(@@plague_level)
    # and then create that number of new zombies,
    newly_spawned_zombies = Array.new(newly_spawned_zombies)
    newly_spawned_zombies.each do |new_zombie|
      new_zombie = Zombie.new(max_speed, max_strength)
      # Use @@max_speed and @@max_strength to generate random values for each new zombie's speed and strength.
      max_speed = rand(@@max_speed)
      max_strength = rand(@@max_strength)
      # adding each one to @@horde.
      @@horde << new_zombie
    end#each.do
  end#self.spawn

  def self.increase_plague_level
    # This class method should generate a random number between 0 and 2 and increase @@plague_level by that amount.
    plague_rising = rand(3)
    @@plague_level += plague_rising
  end#self.increase_plague_level

  def self.some_die_off
    # This class method should generate a random number between 0 and 10 and remove that number of zombies from @@horde (hint: you may want to check the Array docs for methods that could help you accomplish this).
    rand(0..10).times do
      @@horde.delete_at(rand(@@horde.count))
    end#times-do
  end#self.some_die_off

  def self.new_day
    # Every day some zombies die off (phew!),
    some_die_off
    # some new ones show up,
    spawn
    # and sometimes the zombie plague level increases.
    increase_plague_level
  end#self.new_day

  def outrun_zombie?
    # This instance method should use @@max_speed to generate a random number that represents how fast you manage to run from this particular zombie.
    your_running_speed = rand(@@max_speed)
    # This method should return true if your speed is greater than the zombie's and false otherwise.
    if your_running_speed >= @zombie_speed
      return true
    else
      return false
    end#if
  end#outrun_zombie?

  def survive_attack?
    # This instance method should use @@max_strength to generate a random number that represents how well you are able to fight off this zombie. This method should return true if your speed is greater than the zombie's and false otherwise.
    your_fighting_skills = rand(@@max_strength)
    if your_fighting_skills > @zombie_strength
      return true
    else
      return false
    end#if
  end#survive_attack?

  def encounter
    # This method should call outrun_zombie? (see below) and survive_attack? (see also below) to determine which scenario applies.
    # In the case that you are turned into a zombie (ie. you don't outrun the zombie but you aren't killed by it), create a new zombie object (that's you!) and add it to the @@horde.
    if outrun_zombie? == true && survive_attack == true
      puts "You escaped from the zombie!"
    elsif outrun_zombie? == false && survive_attack == false
      puts "You got murdered by the zombie!"
    elsif outrun_zombie == false && survive_attack == true
      your_former_self = Zombie.new
      puts "You got turned into a zombie!"
    end#if
    # In all three cases you should return a string that describes what happened to you in the encounter (eg. "You escaped!").
  end#encounter

end#Zombie

# Example outputs:
puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
