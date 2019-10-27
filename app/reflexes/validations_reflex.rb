# frozen_string_literal: true

class ValidationsReflex < ApplicationReflex
  def perform(params = {})
    @reflex_params = params
  end
end
