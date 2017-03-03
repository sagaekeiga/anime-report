class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Jpmobile::ViewSelector
  protect_from_forgery with: :exception
  
    def crawl_create(data)
        @anime = Anime.find_by(title: @title.inner_text)
        @work = Work.find_by(sub_title: data.title)
        if @anime.nil?
         @anime = Anime.new
         @anime.title = @title.inner_text
         @anime.youtube = @youtube.to_s
         @anime.fc2 = @fc2.to_s
         @anime.ani = @ani.to_s
         @anime.hima = @hima.to_s
         @anime.gogo = @gogo.to_s
         @anime.nova = @nova.to_s
         @anime.gooda = @gooda.to_s
         @anime.kiss = @kiss.to_s
         @anime.myvi = @myvi.to_s
         @anime.b9 = @b9.to_s
         @anime.daily = @daily.to_s
         @anime.miomio = @miomio.to_s
         @anime.smove = @smove.to_s
         @anime.date = @work.date
         @anime.save
        end
    end
end
