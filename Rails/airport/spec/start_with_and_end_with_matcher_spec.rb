RSpec.describe 'start_with and End_with matcher' do
  describe 'caterpillar' do
    it 'should check for the substring at the begining or end' do
      expect(subject).to start_with('cat')
      expect(subject).to end_with('pillar')
# has to take care of the case sensitivity
      expect(subject).not_to start_with('Cat')
    end
    it { is_expected.to start_with('cat')}
    it { is_expected.to end_with('pillar')}
  end
  
  describe [:a, :b, :c] do
    it 'should check for the begining or end of the array' do
      expect(subject).to start_with(:a)
      expect(subject).to end_with(:c)
    end
    it { is_expected.to start_with(:a)}
  end

end