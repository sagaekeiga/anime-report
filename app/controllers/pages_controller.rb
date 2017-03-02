class PagesController < ApplicationController
    

  def index
    @q = Work.search(params[:q])
    
    @works = Work.all
    
    # 個別記事のPV数を取り出す
    @works.each do |work|
        @daily_pageviews[work.id] = REDIS.get "works/daily/#{today}/#{work.id}"
    end
    
    # PV数のソーティング
    @daily_pageviews.sort_by{|k, v| v} if !@daily_pageviews.blank?
    
    #上位10個の記事を返す
    @top10_pages = @daily_pageviews[0..10] if !@daily_pageviews.blank?

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
