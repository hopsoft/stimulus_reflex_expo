# frozen_string_literal: true

class ChatReflex < ApplicationReflex
  def post(color, message, message_id)
    chat = {
      id: message_id,
      color: color,
      author: request.remote_ip,
      message: message[0, 100],
      created_at: Time.current.iso8601
    }

    chats = Rails.cache.read(:chats) || []
    chats << chat

    chat_html = ChatsController.render(partial: "chats/chat", locals: {chat: chat, color: color})
    list_selector = "##{color} [data-target='chat.list']"
    input_selector = "##{color} textarea"

    cable_ready
      .insert_adjacent_html(selector: list_selector, html: chat_html, focus_selector: "##{color} textarea")
      .set_value(selector: input_selector, value: "")
      .broadcast

    cable_ready["chat"]
      .dispatch_event(name: "chats:added", detail: {message_id: message_id})
      .broadcast

    morph :nothing
    Rails.cache.write :chats, chats
  end

  def set_color
    session[:chat_color] = element[:href].delete("#")
  end
end
