class MessagesController < ApplicationController

  def index
    @messages = Message.all_in(participants: [BSON::ObjectId.from_string(params[:p]), current_account.id])
  end

  def create
    @message = current_account.messages.create(message_params)
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:text, :participant)
  end

end
