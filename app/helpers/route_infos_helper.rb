# frozen_string_literal: true

# lets us use our collections of route info in our views
module RouteInfosHelper
  def route_controller_info
    @route_controller_info ||= RouteInfo::RoutesCollection.controllers
  end

  def route_name_info
    @route_name_info ||= RouteInfo::RoutesCollection.names
  end

  def route_path_info
    @route_path_info ||= RouteInfo::RoutesCollection.paths
  end

  def route_action_info
    @route_action_info ||= RouteInfo::RoutesCollection.actions
  end

  def route_verb_info
    @route_verb_info ||= RouteInfo::RoutesCollection.verbs
  end
end
