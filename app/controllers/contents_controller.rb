class ContentsController < ApplicationController



  def create
     @content = Content.new(content_params)
     @content.save!
  end
  
  def show
      @q = Work.search(params[:q])
      @content = Content.find(params[:id])
      @works = Work.where(main_title: @content.title).order("created_at")
      @ranks = Work.all.order("rank").reverse
  end

  def new
  end

  def edit
    @content = Content.find(params[:id])
  end
  
  def index
      @contents = Content.all.order("title")
      @q = Work.search(params[:q])
      ids = REDIS.zrevrangebyscore "works/daily/#{Date.yesterday.to_s}", "+inf", 0, limit: [0, 40]
      @ranks = Work.all.order("rank").reverse
  end
  
  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    redirect_to contents_path
  end

      private
      
        def content_params
          params.require(:content).permit(:title, :story, :broadcast, :youtube, :theme, :cast)
        end
end
