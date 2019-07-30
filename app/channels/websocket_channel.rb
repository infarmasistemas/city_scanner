class WebsocketChannel < ApplicationCable::Channel
  def subscribed
    stream_from "websocket_channel-#{current_user.id}"
  end

  def unsubscribed
    puts "unsubs"
  end

  def send_message(data)
    puts "HAHUAUH"
  end
end