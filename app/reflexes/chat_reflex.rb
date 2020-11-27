# frozen_string_literal: true

class ChatReflex < ApplicationReflex
  def post(color, message)
    chat = {
      color: color,
      author: request.remote_ip,
      message: message[0, 100],
      created_at: Time.current.iso8601
    }

    chat_html = ChatsController.render(partial: "chats/chat", locals: {chat: chat, color: color})
    list_selector = "##{color} [data-target='chat.list']"
    input_selector = "##{color} textarea"

    # broadcast to the user that triggered the reflex
    cable_ready.set_value(selector: input_selector, value: "").broadcast

    # global broadcast to everyone
    cable_ready["chat"]
      .insert_adjacent_html(selector: list_selector, html: chat_html, focus_selector: "##{color} textarea")
      .dispatch_event(name: "chats:added")
      .broadcast

    morph :nothing

    chats = Rails.cache.read(:chats) || []
    chats << chat
    Rails.cache.write :chats, chats
  end

  def set_color
    session[:chat_color] = element[:href].delete("#")
  end
end
