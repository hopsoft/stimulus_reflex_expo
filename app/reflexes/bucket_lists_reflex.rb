class BucketListsReflex < StimulusReflex::Reflex
  def create
    PaperTrail.request.whodunnit = session.id
    @highlight_ids = []
    element.dataset[:step].to_i.times do
      @highlight_ids << Mission.create(session_id: session.id).id
    end
    PaperTrail::Version.where(whodunnit: session.id, reified: true).destroy_all
  end

  def edit
    @edit_id = element.dataset[:id].to_i
  end

  def cancel_edit
    @edit_id = nil
  end

  def update
    if mission = Mission.find_by(session_id: session.id, id: element.dataset[:id])
      mission.update title: element[:value]
      @highlight_ids = [mission.id]
    end
    PaperTrail.request.whodunnit = session.id
    PaperTrail::Version.where(whodunnit: session.id, reified: true).destroy_all
  end

  def toggle
    if mission = Mission.find_by(session_id: session.id, id: element.dataset[:id])
      mission.toggle! :completed
      @highlight_ids = [mission.id]
    end
    PaperTrail.request.whodunnit = session.id
    PaperTrail::Version.where(whodunnit: session.id, reified: true).destroy_all
  end

  def destroy
    Mission.find_by(session_id: session.id, id: element.dataset[:id])&.destroy
    PaperTrail.request.whodunnit = session.id
    PaperTrail::Version.where(whodunnit: session.id, reified: true).destroy_all
  end

  def filter
    session[:missions_filter] = element.dataset[:filter]
  end

  def undo
    PaperTrail.request.whodunnit = session.id
    if version = versions(false).first
      version.reify ? version.reify.save! : Mission.where(id: version.item_id).destroy_all
      version.destroy
      new_version = versions(false).first
      new_version.update_attribute :reified, true
      new_version.update_attribute :created_at, version.created_at
      @highlight_ids = [version.item_id]
    end
  end

  def redo
    PaperTrail.request.whodunnit = session.id
    if version = versions(true).first
      version.reify ? version.reify.save! : Mission.where(id: version.item_id).destroy_all
      version.destroy
      new_version = versions(true).first
      new_version&.update_attribute :created_at, version.created_at
      @highlight_ids = [version.item_id]
    end
  end

  def versions(reified)
    PaperTrail::Version.where(whodunnit: session.id, reified: reified).order("versions.created_at DESC")
  end
end
