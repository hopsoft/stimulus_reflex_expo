class DemoComponent < ViewComponent::Base
  with_content_areas :explanation

  def initialize(title: nil, summary: nil, gists: [], demo: nil)
    @title = title
    @summary = summary
    @gists = gists
    @demo = demo
  end

  private

  attr_reader :title, :summary, :gists, :demo

  def render_demo(demo)
    render demo
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
end
