module ValidationsHelper
  def validation_css(model, field)
    return nil unless @stimulus_reflex
    return "invalid" if model.errors[field.to_s].present?
    "valid"
  end
end
