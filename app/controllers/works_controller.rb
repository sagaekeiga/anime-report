class WorksController < ApplicationController
  
  def create
     @work = Work.new(work_params)
     @work.save!
  end

  def destroy
  end

  def edit
  end

  def show
      @work = Work.find(params[:id])
  end

  def index
  end

  def update
  end

  def new
  end
  
      private
      
        def work_params
          params.require(:work).permit(:title, :content, :youtube, :date)
        end
end
