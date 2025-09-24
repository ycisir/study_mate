class MessagesController < ApplicationController

	# def new
	# 	@message = Message.new
	# end

	def create

		@message = Message.new(message_params)
		@message.user = current_user
		@message.save

		SendMessageJob.perform_later(@message.id)
	end
		
	private

	def message_params
		params.require(:message).permit(:body, :room_id, :image)
	end
end
