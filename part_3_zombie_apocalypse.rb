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

  


end#Zombie
