class ContentsController < ApplicationController


  impressionist actions: [:show]

  def create
     @content = Content.new(content_params)
     @content.save!
  end
  
  def show
      @b_search_form = SearchForm.new
      @content = Content.find(params[:id])
      @works = Work.where(main_title: @content.title).order("date")
      impressionist(@content)
  end

  def new
  end

  def edit
    @content = Content.find(params[:id])
  end
  
  def index
      @b_search_form = SearchForm.new
      @contents = Content.all
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
