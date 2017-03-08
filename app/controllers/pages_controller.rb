class PagesController < ApplicationController
    

  def index
    @q = Work.search(params[:q])
    @works = Work.all.order(:sub_title)

    @ranks = Work.all.order("rank").reverse

    
  end
  
  def index_smart_phone
  end
  
end
