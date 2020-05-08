class ApplicationComponent < ViewComponent::Base
  delegate :demos, to: :helpers

  def active?(name)
    controller_name.include? name
  end
end
