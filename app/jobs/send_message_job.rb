class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    message = Message.find(message_id)
    room = message.room

    html = ApplicationController.render(
      partial: "messages/message",
      locals: { message: message }
    )

    activity_html = ApplicationController.renderer.render(
      partial: 'rooms/recent_activity',
      locals: { message: message }
    )

    ActionCable.server.broadcast "room_channel_#{message.room_id}", { html: html, participants: render_participants(room), activity_html: activity_html }
    ActionCable.server.broadcast "activity_channel", { activity_html: activity_html }
  end

  private

  def render_participants(room)
    ApplicationController.renderer.render(
      partial: "rooms/participants",
      locals: { room: room }
    )
  end
end
