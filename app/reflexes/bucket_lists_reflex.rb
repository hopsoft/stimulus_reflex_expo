class BucketListsReflex < StimulusReflex::Reflex
  def create
    PaperTrail.request.whodunnit = session.id
    @created_ids = []
    element.dataset[:step].to_i.times do
      @created_ids << Mission.create(session_id: session.id).id
    end
  end

  def edit
    @edit_id = element.dataset[:id].to_i
  end

  def cancel_edit
    @edit_id = nil
  end

  def update
    PaperTrail.request.whodunnit = session.id
    Mission.find_by(session_id: session.id, id: element.dataset[:id])&.update title: element[:value]
  end

  def toggle
    PaperTrail.request.whodunnit = session.id
    Mission.find_by(session_id: session.id, id: element.dataset[:id])&.toggle! :completed
  end

  def destroy
    PaperTrail.request.whodunnit = session.id
    Mission.find_by(session_id: session.id, id: element.dataset[:id])&.destroy
  end

  def revert
    if version = versions.first
      PaperTrail.request(enabled: false) do
        version.reify ? version.reify.save! : Mission.where(id: version.item_id).destroy_all
        version.destroy
      end
    end
  end

  def filter
    session[:missions_filter] = element.dataset[:filter]
  end

  def versions
    PaperTrail::Version.where(whodunnit: session.id).order("versions.created_at DESC")
  end
end
