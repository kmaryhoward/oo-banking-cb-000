class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end


  def valid?
    self.sender = BankAccount.new(sender)
    self.receiver = BankAccount.new(receiver)
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.sender.valid? && self.status != "complete"
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = "complete"
    elsif !self.sender.valid?
      "Transaction rejected. Please check your account balance."
      self.status = "rejected"
    end

  end

  def reverse_transfer
    if execute_transaction
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end
