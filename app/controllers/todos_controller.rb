class TodosController < ApplicationController
  FILTERS = %w[all active completed].freeze

  def show
    session[:filter] = "all" unless filter_permitted?(session[:filter])
    @all_todos = Todo.where(session_id: session.id)
    @filtered_todos = @all_todos.public_send(session[:filter]).order(:created_at)
  end

  private

  def filter_permitted?(filter)
    FILTERS.include? filter
  end
end
