# frozen_string_literal: true

class TodosController < ApplicationController
  FILTERS = %w[all active completed].freeze
  after_action :cleanup

  def show
    session[:todo_filter] = "all" unless filter_permitted?(session[:todo_filter])
    @all_todos = Todo.where(session_id: session.id.to_s)
    @filtered_todos = @all_todos.public_send(session[:todo_filter]).order(:created_at)
  end

  private

  def filter_permitted?(filter)
    FILTERS.include? filter
  end

  def cleanup
    Todo.old.delete_all
  end
end
