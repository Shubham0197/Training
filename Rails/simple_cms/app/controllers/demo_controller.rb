class DemoController < ApplicationController
  def index
  end

  def Hello
   # render('demo/hello')
    redirect_to(:controller => 'demo', :action => 'index')
  end
end
