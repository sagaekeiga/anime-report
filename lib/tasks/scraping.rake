namespace :scraping do
  desc "auto_scraping"
  task :scraping => :environment do
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
                crawl
  end


    def crawl
    
            @bots = Bot.all
    
            @bots.each do |bot|
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
                       anime.date = @work.date
                       anime.save
                       @twitter = Tweet.new
                       @twitter.text = @work.sub_title
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
        end
    end

      def post
        tweet = Tweet.first
        p status = tweet.text + "が更新されました！" + "http://candii.tk/"
        twitter_client
        @client.update(status)
      end

      def twitter_client
        @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "5UsgucSdL9yzkHLdpxGTthfBg"
        config.consumer_secret     = "g8n1QPviyy6bpG55MkbLh9g6QfKV2aKl1ZQEJ6VUXLTeSuAsch"
        config.access_token        = "838030459871223811-wlz0KWpsigG7YDu0BXAwUsw1j3lSpTk"
        config.access_token_secret = "uSxO2FcYAO50RUzvZvoxrFsH1r32qmdDXr4xuxQhGcHcw"
        end
      end
