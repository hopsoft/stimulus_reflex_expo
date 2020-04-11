# frozen_string_literal: true

class PermalinkReflex < ApplicationReflex
  def filter
    if element[:type] == "checkbox"
      options = instance_variable_get(:"@#{element[:name]}") || []
      if options.include?(element[:value])
        options -= [element[:value]]
      else
        options += [element[:value]]
      end

      instance_variable_set(:"@#{element[:name]}", options)
    else
      instance_variable_set(:"@#{element[:name]}", element[:value])
    end
  end
end
