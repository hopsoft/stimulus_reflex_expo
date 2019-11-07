# frozen_string_literal: true

module BucketListsHelper
  def filter_missions(filter)
    "selected" if session[:missions_filter] == filter.to_s
  end

  def nonreified_event(version)
    {"destroy" => "Destroyed", "create" => "Created", "update" => "Updated"}[version.event]
  end

  def reified_event(version)
    {"destroy" => "Created", "create" => "Destroyed", "update" => "Updated"}[version.event]
  end
end
