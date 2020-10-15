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
    @controller_filter = permitted_filters[:controller]
    @name_filter = permitted_filters[:name]
    @path_filter = permitted_filters[:path]
    @action_filter = permitted_filters[:action]
    @verb_filter = permitted_filters[:verb]
  end

  def permitted_filters
    return {} unless session[:route_filters]

    session[:route_filters]&.slice(*RouteInfo::RouteFilter::ALLOWED_FILTERS)
  end
end
