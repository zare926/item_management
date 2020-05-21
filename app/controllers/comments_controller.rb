class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: current_user.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
