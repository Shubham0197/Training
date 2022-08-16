describe "Comparison Matcher" do
  it "allows for comparison with built in ruby operators" do
    expect(10).to be > 2
    expect(8).to be < 15
    expect(1).to be >= -1
    expect(1).to be >= 1
    expect(22).to be <= 22 
  end

  describe 100 do
    # describe 100 is  same as
    #subject {100}
    it{ is_expected.to be > 90 }
    it{ is_expected.to be >= 100 }
    it{ is_expected.not_to be >= 900 }
  end

end