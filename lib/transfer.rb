class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    elsif !valid?
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
