class MessagesController < ApplicationController

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		@message.user = current_user
		#@message.save

		#redirect_to request.referrer
		
		ActionCable.server.broadcast
    "room_channel_#{@message.room_id}", message: "test"

	end
		
	private

	def message_params
		params.require(:message).permit(:body, :user_id, :room_id)
	end
end
