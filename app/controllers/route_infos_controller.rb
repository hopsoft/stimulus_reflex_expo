# frozen_string_literal: true

class RouteInfosController < ApplicationController
  helper RouteInfosHelper
  before_action :load_defaults, :populate_filter_keys, only: :show

  def show
    @routes = RouteInfo::RoutesCollection.routes(filters: permitted_filters)
  end

  private

  def load_defaults
    return if session[:route_filters].is_a? Hash

    session[:route_filters] = {}
  end

  def populate_filter_keys
    @controller_filter = permitted_filters&.dig(:controller)
    @name_filter = permitted_filters&.dig(:name)
    @path_filter = permitted_filters&.dig(:path)
    @action_filter = permitted_filters&.dig(:action)
    @verb_filter = permitted_filters&.dig(:verb)
    @external_toggle = permitted_filters&.dig(:external_only)
  end

  def permitted_filters
    session[:route_filters]&.slice(*RouteInfo::RouteFilter::ALLOWED_FILTERS)
  end
end
