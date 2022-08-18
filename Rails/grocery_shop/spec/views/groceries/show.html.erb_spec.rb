require 'rails_helper'

RSpec.describe "groceries/show", type: :view do
  before(:each) do
    @grocery = assign(:grocery, Grocery.create!(
      product: "Product",
      price: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Product/)
    expect(rendered).to match(/2.5/)
  end
end
