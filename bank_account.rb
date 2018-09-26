class BankAccount
  attr_accessor :balance
  @@minimum_balance = 200

  def self.minimum_balance=(new_min)
    @@minimum_balance = new_min
  end

  def initialize(balance, client_name)
    @balance =
    if balance < @@minimum_balance
      raise ArgumentError.new("Account Balance too low!")
    else
      balance
    end
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def transfer(amount, bank_account)
    @balance -= amount
    bank_account.balance += amount
  end

end
