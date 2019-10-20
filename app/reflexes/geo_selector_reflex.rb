# frozen_string_literal: true

class GeoSelectorReflex < ApplicationReflex
  def select_region
    @region = session[:region] = element[:value].start_with?("Select a") ? nil : element[:value]
  end

  def select_subregion
    @region = session[:region]
    @subregion = session[:subregion] = element[:value].start_with?("Select a") ? nil : element[:value]
  end

  def select_country
    @region = session[:region]
    @subregion = session[:subregion]
    @country = session[:country] = element[:value].start_with?("Select a") ? nil : element[:value]
    @country_instance = ISO3166::Country.all.find { |country|
      country.region == @region && country.subregion == @subregion && country.name == @country
    }
  end
end
