class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    message = Message.find(message_id)
    room = message.room

    html = ApplicationController.render(
      partial: "messages/message",
      locals: { message: message }
    )

    ActionCable.server.broadcast "room_channel_#{message.room_id}", { html: html, participants: render_participants(room) }
  end

  private

  def render_participants(room)
    ApplicationController.renderer.render(
      partial: "rooms/participants",
      locals: { room: room }
    )
  end
end
