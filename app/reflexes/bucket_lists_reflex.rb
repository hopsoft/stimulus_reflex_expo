class BucketListsReflex < StimulusReflex::Reflex
  def create
    purge_old_versions
    @highlight_ids = []
    element.dataset[:step].to_i.times do
      @highlight_ids << Mission.create(session_id: session.id).id
    end
  end

  def edit
    @edit_id = element.dataset[:id].to_i
  end

  def cancel_edit
    @edit_id = nil
  end

  def update
    purge_old_versions
    if mission = Mission.find_by(session_id: session.id, id: element.dataset[:id])
      mission.update title: element[:value]
      @highlight_ids = [mission.id]
    end
  end

  def toggle
    purge_old_versions
    if mission = Mission.find_by(session_id: session.id, id: element.dataset[:id])
      mission.toggle! :completed
      @highlight_ids = [mission.id]
    end
  end

  def destroy
    purge_old_versions
    Mission.find_by(session_id: session.id, id: element.dataset[:id])&.destroy
  end

  def filter
    session[:missions_filter] = element.dataset[:filter]
  end

  def restore(command = nil)
    PaperTrail.request.whodunnit = session.id
    reified = command || element.dataset[:command] == "redo"
    @highlight_ids = []
    loop do
      if version = versions(reified).send(reified ? :last : :first)
        break if element.dataset[:id].to_i == version.id && reified == false
        version.reify ? version.reify.save! : Mission.where(id: version.item_id).destroy_all
        version.destroy
        new_version = versions(reified).send(reified ? :last : :first)
        new_version.update_attribute(:reified, true) unless reified
        new_version&.update_attribute :created_at, version.created_at
        @highlight_ids << version.item_id
      end
      break if element.dataset[:id].nil? || element.dataset[:id].to_i == version.id
    end
  end

  def versions(reified)
    PaperTrail::Version.where(whodunnit: session.id, reified: reified).order("versions.created_at DESC")
  end

  def purge_old_versions
    PaperTrail.request.whodunnit = session.id
    PaperTrail::Version.where(whodunnit: session.id, reified: true).destroy_all
  end
end
