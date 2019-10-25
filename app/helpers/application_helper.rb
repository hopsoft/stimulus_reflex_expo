# frozen_string_literal: true

module ApplicationHelper
  def css(default = "", conditionals = {})
    additions = conditionals.each_with_object([]) { |(k, v), memo| memo << k if v }
    "#{default} #{additions.join " "}"
  end

  def active?(name)
    controller_name.include? name
  end
end
