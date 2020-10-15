module RouteInfo
  # Just a wrapper to turn our convoluted route object into a nice object
  class DecoratedRoute
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