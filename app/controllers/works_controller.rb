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
      @q        = Work.search(params[:q])
      @work = Work.find(params[:id])
      @rank = REDIS.zincrby "works/all/#{Date.today.to_s}", 1, @work.id
      @iframe = Content.find_by(title: @work.main_title)
  end

  def index
    @q        = Work.search(params[:q])
    @works = @q.result(distinct: true)
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
