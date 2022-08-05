require 'rails_helper'

RSpec.describe Aircraft, :type => :model do
  subject{
    described_class.new(name: "Airmax", cruising_range: 1300)
  }

  it " is invalid if its cruising range is below 1000" do
    cruisable= subject.cruise?
    expect(cruisable).to be_truthy
  end

  it "is valid with a name" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    if subject.name.nil?
      expect(subject).to_not be_valid
    end
  end
end
