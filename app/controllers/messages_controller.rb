class MessagesController < ApplicationController
  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to room_path(@message.room), notice: 'Message was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
