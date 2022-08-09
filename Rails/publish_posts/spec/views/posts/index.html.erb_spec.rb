require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Title",
        body: "MyText",
        user: current_user,
        views: 2
      ),
      Post.create!(
        title: "Title",
        body: "MyText",
        user: current_user,
        views: 2
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2

  end
end
