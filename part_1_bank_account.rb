class BankAccount

  @@interest_rate = 2.5
  # a float representing the interest rate for all the accounts in the bank
  # ----- I chose 2.5 artibrarily

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

  # STEP 7:
  # Add a class method called create that calls BankAccount.new and adds the new object to @@accounts so that we can find it again in the future. This method should return the new account object. This needs to be a class method because at the time we run it there is no single, specific account object that we are working on.
  @@create(new_account)
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end#@@create

  # STEP 8:
  # Add a class method called total_funds that returns the sum of all balances across all accounts in @@accounts.
  @@total_funds(sum_of_all_balances)
    sum_of_all_balances = @@accounts.sum
  end#@@total_funds

  # STEP 9:
  # This needs to be a class method because it does not pertain to any single, specific account. Add a class method called interest_time that iterates through all accounts and increases their balances according to @@interest_rate.
  @@interest_time(account)

    @@accounts.each do

      interest_div = @@interest_rate / 100.0  # changes 2.5 to 0.025

      interest_add = interest_div + 1         # changes 0.025 to 1.025

      account = account * interest_add

      puts "Account accumulated interest at a rate of #{@@interest_rate}%. New balance is $#{account}."

    end#do
  end#@@interest_time

end#BankAccount
