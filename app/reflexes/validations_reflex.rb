# frozen_string_literal: true

class ValidationsReflex < ApplicationReflex
  def perform(user_params = {})
    @user = User.new(user_params)
    @user.validate
  end
end
