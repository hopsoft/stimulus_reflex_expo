# frozen_string_literal: true

module ChatDemo
  def setup_chat_demo
    session[:chat_color] ||= "red"
    @chats ||= Rails.cache.read(:chats) || []
  end
end
