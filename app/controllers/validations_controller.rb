# frozen_string_literal: true

class ValidationsController < ApplicationController
  before_action :assign_params

  def show
    @user ||= User.new(user_params)
    @user.validate
  end

  private

  def assign_params
    self.params = @reflex_params if @reflex_params.present?
  end

  def user_params
    return {} unless params.key?(:user)
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
