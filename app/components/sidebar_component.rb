class SidebarComponent < ViewComponent::Base
    def demos
    %w[
      book_search
      chat
      geo_selector
      gravatar
      reverse_text
      tabular
      todo
      validation
    ]
  end
end
