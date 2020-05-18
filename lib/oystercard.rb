class Oystercard
  attr_reader :balance
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(num)
    message = "The maximum of #{MAXIMUM_BALANCE} would be exceeded."
    fail message if balance + num > MAXIMUM_BALANCE
    @balance += num
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    fail "Insufficient funds." if @balance < MINIMUM_FARE
    @journey = true
  end

  def touch_out
    @journey = false
    @balance -= MINIMUM_FARE
  end

  def in_journey?
    @journey
  end

end
