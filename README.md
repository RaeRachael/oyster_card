
Type of error whilst running RSpec without method which occurred on line 1:
NameError:
  uninitialized constant Oystercard



File path:
An error occurred while loading ./spec/oystercard_spec.rb.

topup(num)
fail "Maximum exceeded" if

subject.deduct(fare)
fare - balance

MININUM_FARE = 1

touch_in
fail message if min_fare > balance

subject.touch_in
@journey = true

subject.touch_out
@journey = false
@balance -= MINIMUM_FARE

subject.in_journey?
@journey

initialize
@journey = false


MININUM_FARE = 1
touch_in
fail message if min_fare > balance


expect{ subject.touch_out }.to change{ subject.balance }.by(-min_fare)

x = balance
sub.touch_out
y =balance
expect(x-y).to eq (-min_fare)


Rembering stations.
'#touch_in' to take a station as argument

touch_in(station)
@entry station = station