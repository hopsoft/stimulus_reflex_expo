# frozen_string_literal: true

module DemosHelper
  def gist_title(language)
    language = language.to_s
    case language
    when "html" then "HTML"
    when "erb" then "ERB"
    when "javascript" then "JavaScript"
    else language.titleize
    end
  end

  def render_demo(name, title)
    prefix = yield if block_given?
    demo = render("/demos/showcase/#{name}/demo")
    render("/demos/demo", title: title) { "#{prefix} #{demo}".html_safe }
  end

  def render_explanation(&block)
    render "/demos/explanation", &block
  end

  def render_gists(&block)
    render "/demos/gists", &block
  end

  def render_gist(language, &block)
    render "/demos/gist", language, &block
  end
end
