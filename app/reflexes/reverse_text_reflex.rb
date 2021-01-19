# frozen_string_literal: true

class ReverseTextReflex < ApplicationReflex
  def perform
    @value = element[:value].reverse
    cable_ready.custom_magic(message: "Holy crap batman!")
  end
end
