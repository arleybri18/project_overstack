class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params)
    #se declara la variable para capturar el user_id del usuario actual
    @comment.user_id = current_user.id
  
  
    if @comment.save
      # se redirecciona al path que llamo la accion
      redirect_to  [@comment.commentable], notice: 'Comment created'
    else
      redirect_to question_path
    end
  end

private
  def comments_params
    #se adicionan los campos de la relacion poliformica
    params.require(:comment).permit(:body,:commentable_id,:commentable_type)
    
  end
end
