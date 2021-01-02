# frozen_string_literal: true

class WorldGameReflex < ApplicationReflex
  include ActionView::Helpers::TextHelper

  before_reflex :set_guess, only: [:check]
  around_reflex :set_countries

  def reset
    @countries = []
  end

  def check
    country = ISO3166::Country.find_country_by_name(@guess)

    if @countries.include?(country)
      text = "You've already guessed '#{country.name}'"
      type = :info
    elsif country
      text = "'#{country.name}' is a country"
      type = :success
      @countries << country

      cable_ready.set_style(
        name: "fill",
        value: "#44449b",
        selector: "##{country.alpha2}"
      ).insert_adjacent_html(
        selector: '#countries',
        html: "<li>#{country.name}</li>"
      )
    else
      text = "'#{@guess}' is not a country"
      type = :error
    end

    cable_ready.morph(
      selector: "#message",
      html: render(partial: 'world_games/message', locals: { text: text, type: type })
    ).text_content(
      selector: '#score',
      text: pluralize(@countries.count, 'point')
    )

    morph :nothing
  end

  private

    def set_guess
      @guess = params[:guess]
      throw :abort if @guess.empty?
    end

    def set_countries
      @countries = session[:world_game_countries] || []
      yield
      session[:world_game_countries] = @countries
    end
end
