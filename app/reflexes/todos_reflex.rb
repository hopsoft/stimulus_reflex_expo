# frozen_string_literal: true

class TodosReflex < ApplicationReflex
  def create
    Todo.create session_id: session.id, title: element[:value]
  end

  def edit
    @edit_id = element.dataset[:id].to_i
  end

  def cancel_edit
    @edit_id = nil
  end

  def update
    Todo.find_by(session_id: session.id.to_s, id: element.dataset[:id])&.update title: element[:value]
  end

  def toggle
    Todo.find_by(session_id: session.id.to_s, id: element.dataset[:id])&.toggle! :completed
  end

  def destroy
    Todo.find_by(session_id: session.id.to_s, id: element.dataset[:id])&.destroy
  end

  def toggle_all
    todos = Todo.where(session_id: session.id.to_s)
    todos.update_all completed: todos.active.exists?
  end

  def destroy_completed
    Todo.where(session_id: session.id.to_s, completed: true).destroy_all
  end

  def filter
    session[:todo_filter] = element.dataset[:filter]
  end
end
