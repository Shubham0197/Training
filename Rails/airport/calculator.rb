require 'rspec/autorun'

class Calculator
  def add(a,b)

  end 

end


describe Calculator do
  it "adds two numbers" do
    calculator = Calculator.new

    expect(calculator.add(2,3)).to eq(5)
  end
end