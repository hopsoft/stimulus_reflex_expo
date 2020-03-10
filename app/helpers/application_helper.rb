# frozen_string_literal: true

module ApplicationHelper
  def css(default = "", conditionals = {})
    additions = conditionals.each_with_object([]) { |(k, v), memo| memo << k if v }
    "#{default} #{additions.join " "}"
  end

  def active?(name)
    controller_name.include? name
  end

  def permalink(query = {})
    query = query.select { |_, val| val.present? }
    "#{request.protocol}#{Rails.env.development? ? request.host_with_port : host}#{request.path}?#{query.to_query}"
  end
end
