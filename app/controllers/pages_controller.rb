class PagesController < ApplicationController
    
  http_basic_authenticate_with name: "寒河江京我", password: "s19930528", :only => :post

  def index
      @b_search_form = SearchForm.new
  end
  
  def index_smart_phone
  end
  
  def detection
      @a = "ここはdetection"
      @b_search_form = SearchForm.new(params[:b_search])
      @search_bots = @b_search_form.bot_search(@b_search_form.title)
  end
  
end
