module ValidationsHelper
  def validation_status(user, attr)
    return :ignore unless user.attributes[attr.to_s].present?
    user.errors[attr].present? ? :invalid : :valid
  end
end
