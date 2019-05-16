class BankAccount
  attr_accessor :name, :balance, :status, :valid

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @valid = valid
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      self.valid = true
    else
      self.valid = false
    end
  end

  def close_account
    self.status = "closed"
  end

  private
  def name=(name)
    @name
  end
end
