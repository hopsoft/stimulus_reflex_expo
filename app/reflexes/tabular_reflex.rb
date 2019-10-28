# frozen_string_literal: true

class TabularReflex < StimulusReflex::Reflex
  def sort
    session[:sort_order] = sort_order
    session[:sort] = element.dataset[:sort]
  end

  def filter
    session[:filter] = element[:value]
    session[:page] = 1
  end

  def page
    session[:page] = element.dataset[:page]
  end

  def sort_order
    return :reverse if session[:sort] == element.dataset[:sort] && session[:sort_order] != :reverse
    :forward
  end
end
