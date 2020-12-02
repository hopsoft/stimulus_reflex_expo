# frozen_string_literal: true

class ReverseTextReflex < ApplicationReflex
  def perform
    morph :nothing
    cable_ready.text_content(selector: "#reversed-text", text: element[:value].reverse).broadcast
  end
end
