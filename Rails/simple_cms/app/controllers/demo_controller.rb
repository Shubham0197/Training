class DemoController < ApplicationController
  def index
  end

  def Hello
    render('demo/hello')
  end
end
