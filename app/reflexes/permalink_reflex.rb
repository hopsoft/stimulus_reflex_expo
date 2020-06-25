# frozen_string_literal: true

class PermalinkReflex < ApplicationReflex
  def filter
    attribute = element[:name].to_sym

    if attribute == :price
      session[attribute] = element.values || request.params[attribute].split(",") || []
    else
      session[attribute] = element.value
    end
  end
end
