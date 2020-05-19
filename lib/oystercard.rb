class Oystercard
  attr_reader :balance
  attr_reader :entry_station
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

  def touch_in(entry_station)
    fail "Insufficient funds." if @balance < MINIMUM_FARE
    @entry_station = entry_station
    # @journey = true
    @entry_station
  end

  def touch_out
    @journey = false
    deduct(MINIMUM_FARE)
  end

  def in_journey?
    @journey
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
