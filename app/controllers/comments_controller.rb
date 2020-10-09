class CommentsController < ApplicationController
  
  def create
    @message = Message.new(message_params)
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
