class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
  end
end
