# frozen_string_literal: true

class PermalinkReflex < ApplicationReflex
  def filter
    if element[:type] == "checkbox"
      options = session[element[:name].to_sym] || []
      if options.include?(element[:value])
        options -= [element[:value]]
      else
        options += [element[:value]]
      end

      session[element[:name].to_sym] = options
    else
      session[element[:name].to_sym] = element[:value]
    end
  end
end
