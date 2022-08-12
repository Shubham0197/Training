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

  describe 'equal and be matcher' do
    let(:c) {[1,2,3]}
    let(:d) {[1,2,3]}
    let(:e) {c}

    it "cares abount the object identity" do
      expect(d).to eql(c)
      expect(c).to eql(d)
      expect(c).not_to equal(d)
      expect(c).to equal(e)
      expect(c).to be(e)

    end
  end


end