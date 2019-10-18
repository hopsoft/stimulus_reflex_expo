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

  def gist_lines(lines = [])
    lines.reject { |line| line.to_s.strip =~ /\A(#|\/|\*|\<--)/ }
  end

  def render_demo(name)
    render("/demos/demo") { render "/demos/showcase/#{name}/demo" }
  end

  def render_explanation(&block)
    render "/demos/explanation", &block
  end

  def render_gists(&block)
    render "/demos/gists", &block
  end

  def render_gist(language, path)
    lines = gist_lines(File.open(Rails.root.join(path)).readlines)
    code = lines.select(&:present?)
    render("/demos/gist", language: language, path: path, loc: code.size) { lines.join }
  end
end
