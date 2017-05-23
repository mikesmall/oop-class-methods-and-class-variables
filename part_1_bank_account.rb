class BankAccount
  @@interest_rate = 2.5

  @@accounts = []

  attr_accessor :balance

  # initialize instance method that sets @balance to zero.
  def initialize(balance)
    balance = 0
    @balance = balance
  end#initialize

  # instance method called deposit that accepts a number as an argument and adds that amount to the account's balance
  def deposit(deposit)
  deposit = deposit.to_f
    @balance = @balance + deposit
  end#@deposit

  # Add an instance method called withdraw that accepts a number as an argument and subtracts that amount from the account's balance.
  def withdraw(withdrawal)
    withdrawal = withdrawal.to_f
    @balance = @balance -= withdrawal
  end#@withdraw

  # Add a class method called create that calls BankAccount.new and adds the new object to @@accounts so that we can find it again in the future. This method should return the new account object. This needs to be a class method because at the time we run it there is no single, specific account object that we are working on.
  def self.create
    new_account = BankAccount.new(0.0)
    @@accounts << new_account
    return new_account
  end#self.create

  # Add a class method called total_funds that returns the sum of all balances across all accounts in @@accounts.
  def self.total_funds
    sum_of_all_balances = 0
    @@accounts.each {|account| sum_of_all_balances = sum_of_all_balances + account.balance}
      return sum_of_all_balances
    # Found online:
    #   def sumArray(a)
    #     sum = 0
    #     a.each {|x| sum = sum + x }
    #     return sum
  end#self.total_funds

  # This needs to be a class method because it does not pertain to any single, specific account. Add a class method called interest_time that iterates through all accounts and increases their balances according to @@interest_rate.
  def self.interest_time
    @@accounts.each do |account|
      interest_div = @@interest_rate / 100.0  # changes 2.5 to 0.025
      interest_add = interest_div + 1         # changes 0.025 to 1.025
      account.balance = account.balance * interest_add
      puts "Account accumulated interest at a rate of #{ @@interest_rate }%. New balance is $#{account.balance}." # This is to test the output.
    end#do
  end#@@interest_time

end#BankAccount

# Example output from Alexa:
my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0 -- GOOD
puts BankAccount.total_funds # 0 -- GOOD
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200 -- GOOD
puts your_account.balance # 1000 -- GOOD
puts BankAccount.total_funds # 1200 -- GOOD
BankAccount.interest_time # -- FIX THIS
puts my_account.balance # 202.0 -- 204.999997
puts your_account.balance # 1010.0 -- 1025
puts BankAccount.total_funds # 1212.0 -- 1230
my_account.withdraw(50)
puts my_account.balance # 152.0 -- 154.999997
puts BankAccount.total_funds # 1162.0 -- 1180
