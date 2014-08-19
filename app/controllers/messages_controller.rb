class MessagesController < ApplicationController
  before_action :require_user_name

  # POST /messages
  def create
    @message = Message.new(message_params.merge(speaker: @user_name))

    respond_to do |format|
      if @message.save
        format.html { redirect_to room_path(@message.room), notice: 'Message was successfully created.' }
        format.js {
          html = render_to_string partial: 'message', locals: { message: @message }
          data = {status: :created, html: html}
          WebsocketRails["room.#{@message.room_id}"].trigger :message, data.to_json
          render json: {status: :created}
        }
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
