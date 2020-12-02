# frozen_string_literal: true

class TabularReflex < ApplicationReflex
  include Tabular

  def search
    params[:query] = element[:value].strip
    update_client
  end

  def order
    params[:order_by] = element.dataset["column-name"]
    params[:direction] = element.dataset["direction"]
    update_client
  end

  def paginate
    params[:page] = element.dataset[:page].to_i
    update_client
  end

  private

  def update_client
    prepare_variables

    assigns = {
      query: @query,
      order_by: @order_by,
      direction: @direction,
      page: @page,
      pagy: @pagy,
      restaurants: @restaurants
    }

    uri = URI.parse([request.base_url, request.path].join)
    uri.query = assigns.except(:restaurants, :pagy).to_query

    morph :nothing

    cable_ready
      .inner_html(selector: "#search-results", html: render(partial: "tabulars/search_results", assigns: assigns))
      .push_state(url: uri.to_s)
      .broadcast
  end
end
