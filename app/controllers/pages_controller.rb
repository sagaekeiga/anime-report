class PagesController < ApplicationController
    

  def index
    @q = Work.search(params[:q])
    @works = Work.all

    ids = REDIS.zrevrangebyscore "works/daily/#{Date.yesterday.to_s}", "+inf", 0, limit: [0, 5]
    @ranking_articles = ids.map{ |id| Work.find(id) }
    if @ranking_articles.count < 5
      adding_articles = Work.order(updated_at: :DESC).where.not(id: ids).limit(5 - @ranking_articles.count)
      @ranks = @ranking_articles.concat(adding_articles)
    end
    
  end
  
  def index_smart_phone
  end
  
end
