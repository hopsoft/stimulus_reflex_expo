# frozen_string_literal: true

class ValidationsController < ApplicationController
  def show
    @user ||= User.new(user_params)
    @user.validate
  end

  private

  def user_params
    return {} unless params.key?(:user)
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
