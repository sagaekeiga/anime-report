class PagesController < ApplicationController
  def index
  end
  
  def index_smart_phone
  end
  
  def post
   @anime = Anime.new
  end
end
