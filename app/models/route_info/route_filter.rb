# frozen_string_literal: true

module RouteInfo
  # Can Dynamically Filter Our Routes Based On Scopes
  class RouteFilter
    ALLOWED_FILTERS = %i[name controller path action verb external_only].freeze

    attr_reader :routes

    def initialize(scopes)
      @scopes = scopes
      @routes = filter_routes
    end

    def filters
      # whitelist out filters since we want to use them dynamically
      @filters ||= @scopes.slice(*ALLOWED_FILTERS)
    end

    def filter_routes
      @filter_routes = RoutesCollection.fetch_decorated_routes
      filters.each { |k, v| public_send("filter_by_#{k}", v) }
      @filter_routes
    end

    def filter_by_controller(controller_name)
      @filter_routes.select! { |route| route.controller&.include? controller_name }
    end

    def filter_by_verb(verb_name)
      @filter_routes.select! { |route| route.verb == verb_name }
    end

    def filter_by_action(action_name)
      @filter_routes.select! { |route| route.action == action_name }
    end

    def filter_by_name(name)
      @filter_routes.select! { |route| route.name&.include? name }
    end

    def filter_by_path(path)
      @filter_routes.select! { |route| route.path&.include? path }
    end

    def filter_by_external_only(choice)
      return unless %w[true checked on].include? choice.downcase

      @filter_routes.reject! { |route| route.internal == true }
    end
  end
end
