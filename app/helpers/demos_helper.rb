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

  def regions
    countries = ISO3166::Country.all
    countries.map(&:region).uniq.sort.select(&:present?)
  end

  def subregions(region)
    countries = ISO3166::Country.all.select { |c| c.region == region }
    countries.map(&:subregion).uniq.sort.select(&:present?)
  end

  def countries(region, subregion)
    countries = ISO3166::Country.all.select { |c| c.region == region && c.subregion == subregion }
    countries.uniq.sort.select(&:present?).map(&:name)
  end

  def active_chat?(color)
    session[:chat_color] == color.to_s
  end

  def chat_css(color)
    case color.to_sym
    when :red then "bg-danger-light border-danger-light text-danger"
    when :yellow then "bg-warning-light border-warning-light text-warning-dark"
    when :blue then "bg-primary-light border-primary-light text-primary"
    end
  end

  def chat_border_css(color)
    case color.to_sym
    when :red then "border-danger-light"
    when :yellow then "border-warning-light"
    when :blue then "border-primary-light"
    end
  end

  def chat_author?(chat)
    chat[:author] == request.remote_ip
  end
end
