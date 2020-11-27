# frozen_string_literal: true

class ChatsController < ApplicationController
  def show
    session[:chat_color] ||= "red"
    @chats = Rails.cache.read(:chats) || []
    @chats.shift while @chats.size > 50
    Rails.cache.write :chats, @chats
  end
end
