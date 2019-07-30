class WebsocketChannel < ApplicationCable::Channel
  def subscribed
    stream_from "websocket_channel-#{current_user.id}"
  end

  def unsubscribed
    puts 'unsubscribed'
  end
end