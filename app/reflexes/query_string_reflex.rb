# frozen_string_literal: true

class QueryStringReflex < ApplicationReflex
  def filter
    instance_variable_set(:"@#{element[:name]}", element[:value])
  end
end
