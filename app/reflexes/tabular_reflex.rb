# frozen_string_literal: true

class TabularReflex < StimulusReflex::Reflex
  def search
    session[:query] = element[:value].strip
    session[:page] = 1
  end

  def order
    session[:order_by] = element.dataset["column-name"]
    session[:direction] = session[:direction] == "asc" ? "desc" : "asc"
  end
end
