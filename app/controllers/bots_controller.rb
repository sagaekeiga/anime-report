class BotsController < ApplicationController

  http_basic_authenticate_with name: "anime", password: "s19930528"

    require 'open-uri'
    def index
      @q = Work.search(params[:q])
      @bots = Bot.all
    end
    
    def show
      @bot = Bot.find(params[:id])
    end
    
    def crawl
        @q = Work.search(params[:q])

        @bots = Bot.all

        @bots.each do |bot|
        begin
        doc = Nokogiri.HTML(open("#{bot.url}"))
            @title = doc.css('div.mainEntryBody')
              doc.css('a').each do |element|
                  p @ani = element[:href].to_s.match(%r{http://www.anitube.se/video.*$}) if !element[:href].to_s.match(%r{http://www.anitube.se/video.*$}).nil?
                  p @hima = element[:href].to_s.match(%r{http://himado.in/\d{6}}) if !element[:href].to_s.match(%r{http://himado.in/\d{6}}).nil?
                  p @daily = element[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}) if !element[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}).nil?
                  p @miomio = element[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}) if !element[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}).nil?
                  p @b9 = element[:href].to_s.match(%r{http://up.*$}) if !element[:href].to_s.match(%r{http://up.*$}).nil?
                  p @youtube = element[:href].to_s.match(%r{https://www.youtube.com/watch.*$}) if !element[:href].to_s.match(%r{https://www.youtube.com/watch.*$}).nil?
                  p @smove = element[:href].to_s.match(%r{http://say-move.org/comeplay.*$}) if !element[:href].to_s.match(%r{http://say-move.org/comeplay.*$}).nil?
              end
        rescue
         p "bot.urlエラー"
        end
                  @anime = Anime.find_by(title: @title.inner_text)
                  @work = Work.find_by(sub_title: bot.title)
                  if @anime.nil?
                   anime = Anime.new
                   anime.title = @title.inner_text
                   anime.youtube = @youtube.to_s
                   anime.fc2 = @fc2.to_s
                   anime.ani = @ani.to_s
                   anime.hima = @hima.to_s
                   anime.gogo = @gogo.to_s
                   anime.nova = @nova.to_s
                   anime.gooda = @gooda.to_s
                   anime.kiss = @kiss.to_s
                   anime.myvi = @myvi.to_s
                   anime.b9 = @b9.to_s
                   anime.daily = @daily.to_s
                   anime.miomio = @miomio.to_s
                   anime.smove = @smove.to_s
                   anime.date = @work.date if !@work.nil?
                   anime.save
                   @twitter = Tweet.new
                   @twitter.text = @work.sub_title if !@work.nil?
                   @twitter.save!
                   post
                  end

                    @ani = ""
                  p @hima = ""
                  p @daily = ""
                  p @miomio = ""
                  p @b9 = ""
                  p @youtube = "" 
                  p @smove = ""
                  
        end
        redirect_to root_path
    end
    
    def scraping
        @q = Work.search(params[:q])

        doc = Nokogiri.HTML(open("http://tvanimedouga.blog93.fc2.com/"))
              doc.css('#mainBlock > div.index_area > div > div > a').each do |element|
                  
                @new_url = element[:href]
                @test_bot = Bot.find_by(url: @new_url)
                
                    if @test_bot.nil?
                        @work = Work.new
                        doc_work = Nokogiri.HTML(open("#{@new_url}"))
                        @work.main_title = doc_work.css('#mainBlock > div.mainEntryBlock > div.mainEntryTitle').inner_text
                        @work.sub_title = doc_work.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntryBody').inner_text
                        @work.date = Date.today
                        @work.content = ""
                        @work.youtube = ""
                        @work.rank = 0
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
    
    def scrap
        @q = Work.search(params[:q])
        doc = Nokogiri.HTML(open("http://tvanimedouga.blog93.fc2.com/blog-entry-1028.html"))

              doc.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntrykiji > a').each do |element|
                @content = Content.new
                if !element[:href].to_s.match(/.*html$/).nil?
                    p @content.url = element[:href].to_s.match(/.*html$/)
                    @content.title = ""
                    @content.story = ""
                    @content.broadcast = ""
                    @content.youtube = ""
                    @content.theme = ""
                    @content.cast = ""
                    @content.content = ""
                    @content.save
                end
              end
    end
    
    def insert_content
        @q = Work.search(params[:q])
        @contents = Content.all
        @contents.each do |content|
            begin
                p @content = Content.find_by(url: content.url)
                p "失敗"
                if @content.title.blank?
                    doc = Nokogiri.HTML(open("#{content.url}"))
                    @content.title = doc.xpath('//*[@id="baseBlock"]/div[3]/a[2]').inner_text
                    @content.story = doc.xpath('//*[@id="mainBlock"]/div[3]/div[2]/div[1]').inner_text
                    @content.broadcast = ""
                    @content.youtube = ""
                    @content.theme = ""
                    @content.cast = ""
                    @content.url = content.url
                    @content.content = doc.xpath('//*[@id="mainBlock"]/div[3]/div[2]/div[2]').inner_text
                    @content.save
                    p "成功"
                end
            rescue
                p "エラー回避"
            end
        end
    end
    
    def insert_bot
        @q = Work.search(params[:q])
        @contents = Content.all
        @contents[342..3149].each do |content|
            
                begin
                    doc = Nokogiri.HTML(open("#{content.url}"))
                rescue
                    p "エラー回避"
                end
                
                if !doc.nil?
                    doc.xpath('//*[@id="mainBlock"]/div[3]/div[2]/div[2]/a').each do |anchor|
                        
                        begin
                            p @test = anchor[:href].match(/.*html$/).to_s
                        rescue
                            p "test失敗"
                        end
                        
                            p @bot = Bot.find_by(url: @test)
                            if @bot.blank?
                                @bot = Bot.new
                                begin
                                    p @bot.url = anchor[:href].to_s.match(/.*html$/)
                                    p nokogiri = Nokogiri.HTML(open("#{@bot.url}"))
                                    p @bot.title = nokogiri.xpath('//*[@id="mainBlock"]/div[3]/div[2]/div[1]').inner_text
                                rescue
                                    p "@bot.title失敗"
                                end
                                if !@bot.title.blank?
                                    begin
                                        @bot.page_id = ""
                                        @bot.date = Date.today
        
                                    
                                        @work = Work.new
                                        p @work.main_title = nokogiri.xpath('//*[@id="baseBlock"]/div[3]/a[2]').inner_text
                                        p @work.sub_title = nokogiri.xpath('//*[@id="mainBlock"]/div[3]/div[2]/div[1]').inner_text
                                        @work.youtube = ""
                                        @work.date = Date.today
                                        @work.content = ""
                                        @work.rank = 0
                                        
                                        
                                        @bot.save!
                                        @work.save!
                                    rescue
                                        p "Errno::ENOENT (No such file or directory @ rb_sysopen - ):"
                                    end
                                end
                            end

                    end
                end

        end
    end
    
      private
      
        def bot_params
          params.require(:bot).permit(:title, :url, :page_id, :date)
        end
end
