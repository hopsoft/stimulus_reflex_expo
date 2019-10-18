# frozen_string_literal: true

module ApplicationHelper
  def css(default = "", conditionals = {})
    additions = conditionals.each_with_object([]) { |(k, v), memo| memo << k if v }
    "#{default} #{additions.join " "}"
  end

  def active?(name)
    name.to_s == params[:id]
  end

  def lines_to_gist(lines = [])
    lines.shift while lines.first.to_s.strip.blank?
    lines.shift while lines.first.to_s =~ /\A(#|\/\/|\<--)/
    lines.join
  end
end
