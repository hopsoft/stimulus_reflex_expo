# frozen_string_literal: true

class ChatsController < ApplicationController
  def show
    session[:chat_color] ||= "red"
    @chats ||= Rails.cache.read(:chats) || []
  end
end
