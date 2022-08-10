require 'rails_helper'

RSpec.describe Aircraft, :type => :model do
  before do
    @aircraft = FactoryGirl.build(:aircraft)
  end
  let(:expected_aircraft) do
    Monster.new(
      name: 'Aircycle',
      cruising_range: 1300
    )
  end

  subject { Aircraft.new(name: 'Aircycle',cruising_range: 1300) }

  it 'creates a monster with the given features'
    expect(subject).to be_the_same_aircraft_as(:expected_aircraft)
  end

  it " is invalid if its cruising range is below 1000" do
    cruisable= @aircraft.cruise?
    expect(cruisable).to be_truthy
  end

  it "is valid with a name" do
    expect(@aircraft).to be_valid
  end

  it "is not valid without a name" do
    if @aircraft.name.nil?
      expect(@aircraft).to_not be_valid
    end
  end
end
