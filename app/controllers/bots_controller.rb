class BotsController < ApplicationController

    include ActiveModel::Model

    def new
     @bot = Bot.new
    end

    def create
     @bot = Bot.new(bot_params)
     @bot.save
     redirect_to bots_path
    end
    
    def destroy
        @bot = Bot.find(params[:id])
        if @bot.delete
         flash[:success] = "deleted"
        end
        redirect_to root_path
    end
    
    def index
      @b_search_form = SearchForm.new
      @bots = Bot.all
    end
    
    def show
      @bot = Bot.find(params[:id])
    end
    
    def crawl
        @bots = Bot.all
        @crawls = []
        @urls = []
        
        opts = {
            :user_agent => "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)",
        	:obey_robots_txt => true,
        	:depth_limit => 0,
        	:delay => 5
        }

        
        @bots.each do |bot|
         @urls.push("#{bot.url}")
        end
        
            Anemone.crawl(@urls, opts) do |anemone|
            	anemone.on_every_page do |page|
            		@crawls.push(page.doc.css('tbody').to_s)
            	end
            end
    end
    
    def edit
        @bot = Bot.find(params[:id])
    end
    
    def update
        @bot = Bot.find(params[:id])
        @bot.update(bot_params)
        render 'edit'
    end
    
    def detection ##検索結果表示ページを表示
      @b_search_form = SearchForm.new(params[:b_search])
      @search_bots = @b_search_form.bot_search(@b_search_form.name)
    end
    
      private
      
        def bot_params
          params.require(:bot).permit(:title, :url, :page_id, :date)
        end
        
        def detection_params
          params.require(:bot).permit(:title)
        end
end
