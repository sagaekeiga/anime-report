class ContentsController < ApplicationController

  def create
     @content = Content.new(content_params)
     @content.save!
  end
  
  def show
      @content = Content.find(params[:id])
  end

  def new
  end

  def edit
  end

      private
      
        def content_params
          params.require(:content).permit(:title, :story, :broadcast, :youtube, :theme, :cast)
        end
end
