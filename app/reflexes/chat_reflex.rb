# frozen_string_literal: true

class ChatReflex < ApplicationReflex
  include CableReady::Broadcaster

  def post(color, message, message_id)
    @chats = Rails.cache.read(:chats) || []
    @chats.shift while @chats.size > 1000
    @chats << {
      id: message_id,
      color: color,
      author: request.remote_ip,
      message: message,
      created_at: Time.current.iso8601
    }
    Rails.cache.write :chats, @chats
    cable_ready["chat"].dispatch_event name: "chats:added", detail: {message_id: message_id}
    cable_ready.broadcast
  end

  def set_color
    session[:chat_color] = element[:href].delete("#")
  end

  def reload
    # noop: this method exists so we can update the page via StimulusReflex rather than Turbolinks
  end
end
