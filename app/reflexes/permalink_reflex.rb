# frozen_string_literal: true

class PermalinkReflex < ApplicationReflex
  def filter
    session[element[:name].to_sym] = element.value
  end
end
