class BotsController < ApplicationController


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
      @bots = Bot.all
    end
    
    def show
      @bot = Bot.find(params[:id])
    end
    
    def crawl
        @bots = Bot.all

        @bots.each do |bot|
        doc = Nokogiri.HTML(open("#{bot.url}"))
            @title = doc.css('div.mainEntryBody')
              doc.css('a').each do |element|
                  @ani = element[:href].to_s.match(%r{http://www.anitube.se/video.*$}) if !element[:href].to_s.match(%r{http://www.anitube.se/video.*$}).nil?
                  @hima = element[:href].to_s.match(%r{http://himado.in/\d{6}}) if !element[:href].to_s.match(%r{http://himado.in/\d{6}}).nil?
                  @daily = element[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}) if !element[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}).nil?
                  @miomio = element[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}) if !element[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}).nil?
                  @b9 = element[:href].to_s.match(%r{http://up.*$}) if !element[:href].to_s.match(%r{http://up.*$}).nil?
                  @youtube = element[:href].to_s.match(%r{https://www.youtube.com/watch.*$}) if !element[:href].to_s.match(%r{https://www.youtube.com/watch.*$}).nil?
                  @smove = element[:href].to_s.match(%r{http://say-move.org/comeplay.*$}) if !element[:href].to_s.match(%r{http://say-move.org/comeplay.*$}).nil?
              end
            crawl_create(bot)
        
        end
        redirect_to root_path
    end
    
    def scraping

        doc = Nokogiri.HTML(open("http://tvanimedouga.blog93.fc2.com/"))
              doc.css('#mainBlock > div.index_area > div > div > a').each do |element|
                  
                @new_url = element[:href]
                @test_bot = Bot.find_by(url: @new_url)
                
                    if @test_bot.blank?
                        @work = Work.new
                        doc_work = Nokogiri.HTML(open("#{@new_url}"))
                        @work.main_title = doc_work.css('#mainBlock > div.mainEntryBlock > div.mainEntryTitle').inner_text
                        @work.sub_title = doc_work.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntryBody').inner_text
                        @work.date = Date.today
                        @work.content = ""
                        @work.youtube = ""
                        @work.save!
                        
                        @bot = Bot.new
                        @bot.title = doc_work.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntryBody').inner_text
                        @bot.url = @new_url
                        @bot.page_id = ""
                        @bot.date = Date.today
                        @bot.save!
                        
                    end
    
                end
            redirect_to bots_crawl_path
    end
    
    def edit
        @bot = Bot.find(params[:id])
    end
    
    def update
        @bot = Bot.find(params[:id])
        @bot.update(bot_params)
        render 'edit'
    end
    
      private
      
        def bot_params
          params.require(:bot).permit(:title, :url, :page_id, :date)
        end
        
        def detection_params
          params.require(:b_search).permit(:title)
        end
end
