class ValidationsController < ApplicationController
  def show
    @user ||= User.new
  end
end
