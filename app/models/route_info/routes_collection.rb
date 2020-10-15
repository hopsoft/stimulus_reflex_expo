# frozen_string_literal: true

module RouteInfo
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
        routes.map { |route| DecoratedRoute.new(route).to_object }
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

      def paths
        all_routes.map(&:path).compact.uniq
      end

      def routes(filters: {})
        return all_routes unless filters&.count&.positive?

        RouteFilter.new(filters).routes
      end
    end
  end
end
