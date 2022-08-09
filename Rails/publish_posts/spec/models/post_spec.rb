require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')

  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'A Valid Body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = 'Has a title'
    expect(post).to be_valid
  end
  it 'has a body' do
    post = Post.new(
      title: 'A Valid Title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.body = 'Has a title'
    expect(post).to be_valid
  end
  it 'has a title at least 2 characters long' do
    post = Post.new(
      title: '1',
      body: 'A Valid Body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = '12'
    expect(post).to be_valid
  end
  it 'has a body between 5 and 100 characters' do
    post = Post.new(
      title: '12',
      body: '1234',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.body = '12345'
    expect(post).to be_valid

    hundred_char_string = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m'
    post.body = hundred_char_string
    expect(post).to be_valid

    post.body = hundred_char_string + '1'
    expect(post).to_not be_valid
  end
end
