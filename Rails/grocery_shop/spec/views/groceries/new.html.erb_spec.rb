require 'rails_helper'

RSpec.describe "groceries/new", type: :view do
  before(:each) do
    assign(:grocery, Grocery.new(
      product: "MyString",
      price: 1.5
    ))
  end

  it "renders new grocery form" do
    render

    assert_select "form[action=?][method=?]", groceries_path, "post" do

      assert_select "input[name=?]", "grocery[product]"

      assert_select "input[name=?]", "grocery[price]"
    end
  end
end
