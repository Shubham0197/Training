## WARNING: Using the `raise_error` matcher without providing a specific error or message risks false positives, since `raise_error` will match when Ruby raises a `NoMethodError`, `NameError` or `ArgumentError`, potentially allowing the expectation to pass without even executing the method you are intending to call.

RSpec.describe "Raise_Error matcher" do
  def some_method
    x
  end

  class CustomError<StandardError;  end
  
  it 'can check for any error' do
    expect { some_method}.to raise_error(NameError)
    expect { 10 / 0 }.to raise_error(ZeroDivisionError)
  end

  it "can also check for the custom error user-created error" do
    expect { raise CustomError}.to raise_error(CustomError)
  end

end