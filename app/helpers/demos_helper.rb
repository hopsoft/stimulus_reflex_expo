# frozen_string_literal: true

module DemosHelper
  def demos
    %w[
      book_search
      chat
      calendar
      geo_selector
      gravatar
      reverse_text
      tabular
      todo
      validation
    ]
  end

  def render_demo(demo)
    render("/demos/demo") { render demo }
  end

  def render_explanation(&block)
    render "/demos/explanation", &block
  end

  def render_gists(*filepaths)
    render "/demos/gists", filepaths: filepaths, grouped_filepaths: filepaths.group_by { |filepath| language filepath }
  end

  def file_timestamps(filepaths = [])
    filepaths.map { |p| File.mtime(p).iso8601 }
  end

  def file_lines(filepath)
    lines = File.open(Rails.root.join(filepath)).readlines
    lines.reject! { |line| line.to_s.strip =~ /\A(#|\/|\*|\<--)/ }
    lines.shift while lines.first.blank?
    lines.pop while lines.last.blank?
    lines
  end

  def language(filepath)
    case File.extname(filepath)
    when ".scss" then "scss"
    when ".html" then "html"
    when ".erb" then "erb"
    when ".js" then "javascript"
    when ".rb" then "ruby"
    end
  end

  def language_title(language)
    case language
    when "scss" then "CSS"
    when "html" then "HTML"
    when "erb" then "ERB"
    when "javascript" then "JavaScript"
    when "ruby" then "Ruby"
    end
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
