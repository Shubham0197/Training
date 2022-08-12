RSpec.describe "Equality Mtchers" do
  let(:a) {3.0}
  let(:b) {3}

  describe 'eql matcher' do
    it "test for the value and ingnores type" do
      expect(a).to eq(3)
      expect(b).to eq(3.0)
      expect(a).to eq(b)
    end
  end

  describe 'eql matcher' do
    it "test for the value including same type" do
      expect(a).not_to eql(b)
    end
  end
end