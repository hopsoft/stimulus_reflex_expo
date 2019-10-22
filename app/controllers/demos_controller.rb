# frozen_string_literal: true

class DemosController < ApplicationController
  before_action :verify, only: [:show]
  before_action :setup_demo, only: [:show]

  private

  def verify
    filepath = Rails.root.join("app/views/demos/showcase/#{params[:id]}/_show.html.erb")
    render text: "NOT FOUND", status: :not_found unless File.exist?(filepath)
  end

  def setup_demo
    method_name = "setup_#{params[:id].to_s.underscore}"
    send method_name if respond_to?(method_name, true)
  end

  def setup_chat
    session[:chat_room] ||= "red"
    @chats ||= Rails.cache.read(:chats) || []
  end
end
