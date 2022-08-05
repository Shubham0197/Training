require 'rails_helper'

RSpec.describe Aircraft, :type => :model do
  it " is invalid if its cruising range is below 1000" do
    aircraft = Aircraft.new(name: "Airmax", cruising_range: 1300)
    cruisable= aircraft.cruise?
    expect(cruisable).to be_truthy
  end

  it "is not valid without a name" do
    aircraft = Aircraft.new(name: "Airmax", cruising_range: 1300)
    print "Aircraft",aircraft.name
    expect(@aircraft).to be_valid
  end
end
