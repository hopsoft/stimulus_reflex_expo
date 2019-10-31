class MissionsReflex < StimulusReflex::Reflex
  def create
    Mission.create session_id: session.id, title: element[:value]
  end

  def edit
    @edit_id = element.dataset[:id].to_i
  end

  def cancel_edit
    @edit_id = nil
  end

  def update
    Mission.find_by(session_id: session.id, id: element.dataset[:id])&.update title: element[:value]
  end

  def toggle
    Mission.find_by(session_id: session.id, id: element.dataset[:id])&.toggle! :completed
  end

  def destroy
    Mission.find_by(session_id: session.id, id: element.dataset[:id])&.destroy
  end

  def toggle_all
    todos = Mission.where(session_id: session.id)
    todos.update_all completed: todos.active.exists?
  end

  def destroy_completed
    Mission.where(session_id: session.id, completed: true).destroy_all
  end

  def filter
    session[:missions_filter] = element.dataset[:filter]
  end
end
