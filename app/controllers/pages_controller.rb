class PagesController < ApplicationController
    

  def index
    @works = Work.all.sort_by(&:created_at).reverse
    @q = Work.search(params[:q])
  end
  
  def index_smart_phone
  end
  
end
