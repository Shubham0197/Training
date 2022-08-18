require 'rails_helper'

RSpec.describe "groceries/edit", type: :view do
  before(:each) do
    @grocery = assign(:grocery, Grocery.create!(
      product: "MyString",
      price: 1.5
    ))
  end

  it "renders the edit grocery form" do
    render

    assert_select "form[action=?][method=?]", grocery_path(@grocery), "post" do

      assert_select "input[name=?]", "grocery[product]"

      assert_select "input[name=?]", "grocery[price]"
    end
  end
end
