RSpec.describe "all matchers" do
  it 'allows for aggeregrate checks' do
    [5,7,9].each do |val|
      expect(val).to be_odd
    end
  end
  ## CAN DO SAEME THISNG WITH ALL MATCHERS
  it "all matchers for the above code aggregrate checks" do
    expect([5,9,7]).to all(be_odd)
    expect([52,92,72]).to all(be_even)
    expect([[],[],[]]).to all(be_empty)
    expect([5,9,7]).to all(be < 10)

  end 
  
  describe [5,7,9] do
    it {is_expected.to all(be_odd)}
    it {is_expected.to all(be < 10)}

  end
end