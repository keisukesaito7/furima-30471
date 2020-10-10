class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item)
    else
      @item = @comment.item
      render 'items/show'
    end
  end

  private
  def comment_params
    params.permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
