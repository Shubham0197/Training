RSpec.describe "contain_exactly matcher" do
  subject {[1,2,3,4,5]}

  describe 'long form syntax' do
    it 'should check for the presence of all the elements' do
      expect(subject).to contain_exactly(1,2,3,4,5)
      expect(subject).not_to contain_exactly(1,4,5)
      expect(subject).to contain_exactly(3,4,5,1,2)
    end
  end

  it {is_expected.to contain_exactly(1,2,3,4,5)}
  it {is_expected.to contain_exactly(3,1,2,4,5)}

end