class DemoComponent < ApplicationComponent
  with_content_areas :title, :summary, :demo

  def initialize(gists: [])
    @gists = gists
  end

  private

  attr_reader :gists
end
