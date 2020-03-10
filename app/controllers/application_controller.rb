# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_action_cable_identifier

  protected

  def permalink(query = {})
    query = query.select { |_, val| val.present? }
    "#{request.protocol}#{Rails.env.development? ? request.host_with_port : host}#{request.path}?#{query.to_query}"
  end

  private

  def set_action_cable_identifier
    cookies.encrypted[:session_id] = session.id
  end
end
