class King
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

RSpec.describe King do
  # subject { King.new('Boris') }
  # let(:louis) { King.new('Loius') }
  subject { described_class.new('Boris') }
  let(:louis) { described_class.new('Loius') }

  it 'represents a great person' do
    expect(subject.name).to eq('Boris')
    expect(louis.name).to eq('Loius')

  end
end