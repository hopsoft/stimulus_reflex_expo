# frozen_string_literal: true

module GistsHelper
  FORMATTER = Rouge::Formatters::HTMLPygments.new(Rouge::Formatters::HTMLLinewise.new(Rouge::Formatters::HTML.new))

  LEXERS = {
    erb: Rouge::Lexers::ERB.new,
    html: Rouge::Lexers::HTML.new,
    javascript: Rouge::Lexers::Javascript.new,
    ruby: Rouge::Lexers::Ruby.new,
    scss: Rouge::Lexers::Scss.new
  }

  def render_gist(language, source)
    FORMATTER.format LEXERS[language.to_sym].lex(source)
  end
end
