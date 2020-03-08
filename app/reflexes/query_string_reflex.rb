# frozen_string_literal: true

class QueryStringReflex < ApplicationReflex
  def filter
    @category = element[:value]
  end
end
