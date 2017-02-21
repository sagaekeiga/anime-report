class CommentsController < ApplicationController

  def create
    content = params[:content_id]
    
    if !content.nil?
        @content = Content.find(params[:content_id])
        @comment = @content.comments.create(comment_params)
        redirect_to content_path(@content)
    else
        @work = Work.find(params[:work_id])
        @comment = @work.comments.create(comment_params)
        redirect_to work_path(@work)
    end

  end
  
      private
      
        def comment_params
          params.require(:comment).permit(:name, :body, :work_id, :content_id)
        end
  
end
