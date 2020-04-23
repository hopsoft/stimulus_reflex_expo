class Sidebar::DemoComponent < ViewComponent::Base
  def initialize(demo:)
    @demo = demo
  end

  private

  attr_reader :demo

  def link_classes
    "nav-link text-nowrap px-1" << if active?
      " bg-white text-primary-dark border-top border-bottom border-primary-lighter font-weight-bold scale-up-micro opacity-100"
    else
      " text-primary-light font-weight-light opacity-70"
    end
  end

  def icon_classes
    "fa-fw fas opacity-50" << if active?
      " fa-angle-double-right"
    else
      " fa-angle-right"
    end
  end

  def active?
    controller_name.include? demo
  end
end
