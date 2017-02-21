class PagesController < ApplicationController
    
  http_basic_authenticate_with name: "寒河江京我", password: "s19930528", :only => :post

  def index
  end
  
  def index_smart_phone
  end
  
end
