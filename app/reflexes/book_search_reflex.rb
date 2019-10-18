# frozen_string_literal: true

class BookSearchReflex < ApplicationReflex
  def perform
    query = element[:value]
    return unless query.size > 2

    result = HTTP.get("http://openlibrary.org/search.json\?#{{q: query}.to_query}")
    if result.status == 200
      @books = JSON.parse(result.to_s)
    end
  end
end
