RSpec.describe "Predicate Matchers" do
  it 'can be tested with ruby method' do
    result = 16/2
    expect(result.even?).to eq(true)
  end

  it 'can be tested with predicate matchers' do
    #remove predicate method ? and add "be_" in the front for it to be predicate matchers 
    expect(16/2).to be_even
    expect(15).to be_odd
    expect('').to be_empty
    expect(nil).to be_nil
    expect(0).to be_zero
    expect([0]).not_to be_empty
  end

  describe 0 do
    it { is_expected.to be_zero }
  end
end