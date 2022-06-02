class DemoController < ApplicationController
  def index
    @numb = 3
  end
  def hello
   # render('demo/hello')
   @id = params['id']
   @name = params[:name]
   # redirect_to(:controller => 'demo', :action => 'index')
  end
end
