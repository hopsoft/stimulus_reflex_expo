# frozen_string_literal: true

module BucketListsHelper
  def filter_missions(filter)
    "selected" if session[:missions_filter] == filter.to_s
  end
end
