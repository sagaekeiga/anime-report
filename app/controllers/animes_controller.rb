class AnimesController < ApplicationController

    def create
     @anime = Anime.new(anime_params)
     @anime.save
    end
    
    
    def destroy
    end
    
    def show
      @anime = Anime.find(params[:id])
    end
    
      private
      
        def anime_params
          params.require(:anime).permit(:title, :youtube, :fc2, :ani, :hima, :gogo, :nova, :gooda, :kiss, :myvi, :b9, :daily, :miomio, :smove, :date)
        end
    
end
