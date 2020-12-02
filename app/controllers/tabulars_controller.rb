# frozen_string_literal: true

class TabularsController < ApplicationController
  include Tabular

  def show
    prepare_variables
  end
end
