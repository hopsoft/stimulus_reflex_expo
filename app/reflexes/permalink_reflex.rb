# frozen_string_literal: true

class PermalinkReflex < ApplicationReflex
  def filter
    attribute = element[:name].to_sym
    if element[:type] == "checkbox"
      options = session[attribute] || request.params[attribute].split(",") || []
      if options.include?(element[:value])
        options -= [element[:value]]
      else
        options += [element[:value]]
      end

      session[attribute] = options
    else
      session[attribute] = element[:value]
    end
  end
end
