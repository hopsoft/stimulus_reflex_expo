class DemosController < ApplicationController
  def show
    render text: "NOT FOUND", status: :not_found unless File.exist?(Rails.root.join("app/views/demos/_#{params[:id]}.html.erb"))
  end
end
