class HomeController < ApplicationController
  def index
  end

  def books
    @books = Book.all
  end
end
