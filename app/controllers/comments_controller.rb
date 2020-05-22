class CommentsController < ApplicationController

  def create
    @comment = Comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: current_user.id)
    if @comment.save
      redirect_to item_path(@comment.item.id)
    else
      redirect_to item_path(@comment.item.id)
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = @item.comments.find(params[:id])
    @comment.destroy
    redirect_to item_path(@item.id)
  end
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
