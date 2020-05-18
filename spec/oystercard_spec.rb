require 'oystercard'

describe Oystercard do
  it "should have a default balance of zero" do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end

  describe '#top_up' do
    [2,32].each do |num|
      it "should increase balance by the argument" do
        subject.top_up(num)
        expect(subject.balance).to eq(0 + num)
      end
    end
    it "should raise an error when if balance would go above maximum" do
    maximum = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum)
    expect{ subject.top_up(1) }.to raise_error "The maximum of #{maximum} would be exceeded."
    end
  end

  describe '#deduct' do
    it "should reduce balance by its argument" do
      subject.top_up(50)
      subject.deduct(10)
      expect(subject.balance).to eq(40)
    end
  end

  describe '#touch_in' do
    context "should change journey to true" do
      before do
        subject.top_up(5)
        subject.touch_in
      end
      it { is_expected.to be_in_journey }
    end
    it "should raise a fail message when balance below mininum fare" do
      expect{ subject.touch_in }.to raise_error "Insufficient funds."
    end
  end

  describe '#touch_out' do
    context "should change journey to false" do
      before do
        subject.top_up(5)
        subject.touch_in
        subject.touch_out
      end
      it {is_expected.to_not be_in_journey }
    end
    it "should charge mininum fare when touched out" do
      min_fare = Oystercard::MINIMUM_FARE
      expect {subject.touch_out}.to change{subject.balance}.by(-min_fare)
    end
  end


end
