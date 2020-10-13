# frozen_string_literal: true

module AbstractModels
  # class to return information about routes in our rails app
  class RoutesCollection
    class << self
      def all_routes
        @all_routes ||= fetch_decorated_routes
      end

      # we grab routes from rails and
      # turn them into easier to work with objects
      def fetch_decorated_routes
        routes = Rails.application.routes.routes
        routes.map { |route| RouteObject.new(route).to_object }
      end

      # we can use these to build our filter choices
      def controllers
        all_routes.map(&:controller).compact.uniq
      end

      def verbs
        all_routes.map(&:verb).compact.uniq
      end

      def names
        all_routes.map(&:name).compact.uniq
      end

      def actions
        all_routes.map(&:action).compact.uniq
      end

      def routes(filters: {})
        return all_routes unless filters&.count&.positive?

        RouteFilter.new(filters).routes
      end
    end
  end

  # Can Dynamically Filter Our Routes Based On Scopes
  class RouteFilter
    ALLOWED_FILTERS = [:name, :controller, :path, :action, :verb, :internal].freeze
    
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
      @filter_routes.select! { |route| route.controller == controller_name }
    end

    def filter_by_verb(verb_name)
      @filter_routes.select! { |route| route.verb == verb_name }
    end

    def filter_by_action(action_name)
      @filter_routes.select! { |route| route.action == action_name }
    end

    def filter_by_name(name)
      @filter_routes.select! { |route| route.name == name }
    end

    def filter_by_internal(internal_choice)
      if internal_choice == 'external_only'
        @filter_routes.reject! { |route| route.internal == true }
      elsif internal_choice == 'internal_only'
        @filter_routes.select! { |route| route.internal == true }
      end
    end
  end

  # Just a wrapper to turn our convoluted route object into a nice object
  class RouteObject
    ROUTE_ATTRS = %w[name controller path action verb internal reqs].freeze

    def initialize(route)
      @route = ActionDispatch::Routing::RouteWrapper.new(route)
    end

    def to_object
      OpenStruct.new(to_hash)
    end

    def to_hash
      Hash[ROUTE_ATTRS.collect { |attr| [attr, @route.public_send(attr)] }]
    end
  end
end
