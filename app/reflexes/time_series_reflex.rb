class TimeSeriesReflex < ApplicationReflex
  def set_data_source
    session[:data_source] = element.value.to_sym
  end

  def set_start_date
    session[:start_date] = Date.parse(element.value)
  end

  def set_end_date
    session[:end_date] = Date.parse(element.value)
  end
end
