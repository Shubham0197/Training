require 'rails_helper'

RSpec.describe "groceries/index", type: :view do
  before(:each) do
    assign(:groceries, [
      Grocery.create!(
        product: "Product",
        price: 2.5
      ),
      Grocery.create!(
        product: "Product",
        price: 2.5
      )
    ])
  end

  it "renders a list of groceries" do
    render
    assert_select "tr>td", text: "Product".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
