class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params)
    #@user = current_user
    @comment.user_id = current_user.id
    p params
  
  
    if @comment.save
      redirect_to question, notice: 'Comment created'
    else
      puts "Finalizo"
    end
  end

private
  def comments_params
    params.require(:comment).permit(:body,:commentable_id,:commentable_type)
    
  end
end
