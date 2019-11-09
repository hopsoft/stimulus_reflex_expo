class TodosController < ApplicationController
  FILTERS = %w[all active completed].freeze

  def show
    session[:todo_filter] = "all" unless filter_permitted?(session[:todo_filter])
    @all_todos = Todo.where(session_id: session.id)
    @filtered_todos = @all_todos.public_send(session[:todo_filter]).order(:created_at)
  end

  private

  def filter_permitted?(filter)
    FILTERS.include? filter
  end
end
