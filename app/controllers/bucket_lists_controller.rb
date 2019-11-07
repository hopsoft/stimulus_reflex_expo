class BucketListsController < ApplicationController
  FILTERS = %w[all active completed].freeze

  def show
    session[:missions_filter] = "all" unless filter_permitted?(session[:missions_filter])
    @all_missions = Mission.where(session_id: session.id)
    @filtered_missions = @all_missions.public_send(session[:missions_filter]).order(created_at: :desc)
    @versions = PaperTrail::Version.where(whodunnit: session.id).order(:reified, :created_at)
    @current = @versions.where(reified: false).order(:created_at).last
  end

  private

  def filter_permitted?(filter)
    FILTERS.include? filter
  end
end
