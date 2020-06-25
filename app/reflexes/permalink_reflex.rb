# frozen_string_literal: true

class PermalinkReflex < ApplicationReflex
  def filter
    params[element[:name].to_sym] = element.value
  end
end
