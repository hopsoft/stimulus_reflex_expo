# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    sleep 2 # noop with latency for the validation demo
  end
end
