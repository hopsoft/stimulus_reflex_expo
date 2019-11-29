# frozen_string_literal: true

# This file is used by Rack-based servers to start the ActionCable server.

require_relative "config/environment"
Rails.application.eager_load!

run ActionCable.server
