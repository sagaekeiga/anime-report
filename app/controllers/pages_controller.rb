class PagesController < ApplicationController
    

  def index
    @q = Work.search(params[:q])
    
    @works = Work.all
    
    # 個別記事のPV数を取り出す
    @works.each do |work|
        @daily_pageviews[@work.id] = REDIS.get "posts/daily/#{today}/#{work.id}"
    end
    
    # PV数のソーティング
    @daily_pageviews.sort_by{|k, v| v} if !@daily_pageviews.blank?
    
    #上位10個の記事を返す
    @top10_pages = @daily_pageviews[0..10] if !@daily_pageviews.blank?

  end
  
  def index_smart_phone
  end
  
end
