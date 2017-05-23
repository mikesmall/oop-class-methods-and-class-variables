class BankAccount

  @@interest_rate = 0.0
  # a float representing the interest rate for all the accounts in the bank

  @@accounts = []
  # starts as an empty array. This will eventually store
  # the list of all bank accounts in the bank.

  # add an attr_accessor for balance
  attr_accessor :balance

  # initialize instance method that sets @balance to zero.
  def initialize(balance)
    @balance = 0
  end#initialize

  @deposit(deposit)
  deposit = deposit.to_f
    @balance = balance += deposit
  # instance method called deposit that accepts a number as an argument and adds that amount to the account's balance
  end#@deposit

  @withdraw(withdrawal)
    withdrawal = withdrawal.to_f
    @balance = balance -= withdrawal
  # Add an instance method called withdraw that accepts a number as an argument and subtracts that amount from the account's balance.
  end

  # Add a class method called create that calls BankAccount.new and adds the new object to @@accounts so that we can find it again in the future. This method should return the new account object. This needs to be a class method because at the time we run it there is no single, specific account object that we are working on.


  # Add a class method called total_funds that returns the sum of all balances across all accounts in @@accounts.


  # This needs to be a class method because it does not pertain to any single, specific account. Add a class method called interest_time that iterates through all accounts and increases their balances according to @@interest_rate.



end#BankAccount
