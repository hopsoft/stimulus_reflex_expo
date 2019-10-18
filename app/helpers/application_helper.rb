module ApplicationHelper
  def css(default = "", conditionals = {})
    additions = conditionals.each_with_object([]) { |(k, v), memo| memo << k if v }
    "#{default} #{additions.join " "}"
  end

  def active?(name)
    name.to_s == params[:id]
  end
end
