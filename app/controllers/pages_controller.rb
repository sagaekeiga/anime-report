class PagesController < ApplicationController
    

  def index
    @q = Work.search(params[:q])
    @works = Work.all.order(:created_at)

    ids = REDIS.zrevrangebyscore "works/daily/#{Date.yesterday.to_s}", "+inf", 0, limit: [0, 40]
    @ranking_articles = ids.map{ |id| Work.find(id) }
    if @ranking_articles.count < 5
      adding_articles = Work.where.not(id: ids).limit(40 - @ranking_articles.count)
      @ranks = @ranking_articles.concat(adding_articles)
    end
    
  end
  
  def index_smart_phone
  end
  
end
