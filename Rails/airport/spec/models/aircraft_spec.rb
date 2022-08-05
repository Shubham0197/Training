require 'rails_helper'

RSpec.describe Aircraft, :type => :model do
  before do
    @aircraft = FactoryGirl.build(:aircraft)
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
