# frozen_string_literal: true

class PermalinkReflex < ApplicationReflex
  def filter
    instance_variable_set(:"@#{element[:name]}", element[:value])
  end
end
