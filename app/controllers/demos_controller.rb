# frozen_string_literal: true

class DemosController < ApplicationController
  before_action :verify, only: [:show]

  private

  def verify
    filepath = Rails.root.join("app/views/demos/showcase/#{params[:id]}/_show.html.erb")
    render text: "NOT FOUND", status: :not_found unless File.exist?(filepath)
  end
end
