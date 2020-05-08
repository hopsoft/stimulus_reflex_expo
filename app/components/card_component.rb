class CardComponent < ApplicationComponent
  with_content_areas :title, :subtitle, :body, :footer

  private

  def header?
    title || subtitle
  end
end
