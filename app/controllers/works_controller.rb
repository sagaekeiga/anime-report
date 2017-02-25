class WorksController < ApplicationController
  
  def create
     @work = Work.new(work_params)
     @work.save!
  end

  def destroy
        @work = Work.find(params[:id])
        if @work.delete
         flash[:success] = "deleted"
        end
        redirect_to works_path
  end

  def edit
    @work= Work.find(params[:id])
  end

  def show
      @b_search_form = SearchForm.new
      @work = Work.find(params[:id])
      @rank = REDIS.zincrby "works/all/#{Date.today.to_s}", 1, @work.id
  end

  def index
      @b_search_form = SearchForm.new
      @works = Work.all
  end

  def update
        @work = Work.find(params[:id])
        @work.update(work_params)
        redirect_to works_path
  end

  def new
  end
  
      private
      
        def work_params
          params.require(:work).permit(:main_title, :sub_title, :content, :youtube, :date)
        end
end
