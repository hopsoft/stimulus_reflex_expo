# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_action_cable_identifier
  before_action :set_meta_tag_data

  private

  def set_action_cable_identifier
    cookies.encrypted[:session_id] = session.id
  end

  # See https://github.com/kpumuk/meta-tags#allowed-options-for-display_meta_tags-and-set_meta_tags-methods
  def set_meta_tag_data
    set_meta_tags(
      description: "A collection of demos that have been built with StimulusReflex",
      keywords: ["open", "source", "stimulus", "stimulus", "reflex", "stimulusreflex", "stimulus_reflex", "expo", "rails"],
      charset: "utf-8",
      image_src: "https://github.com/hopsoft/stimulus_reflex/blob/master/assets/stimulus-reflex-logo-with-copy.svg",
      index: true,
      manifest: "/site.webmanifest",
      icon: [
        {href: "/favicon.ico", rel: "shortcut icon"},
        {href: "/apple-touch-icon.png", sizes: "180x180", rel: "apple-touch-icon", type: "image/png"},
        {href: "/favicon-32x32.png", sizes: "32x32 96x96", rel: "icon", type: "image/png"},
        {href: "/favicon-16x16.png", sizes: "16x16", rel: "icon", type: "image/png"},
        {href: "/safari-pinned-tab.svg", rel: "mask-icon", color: "#5bbad5", type: "image/svg"}
      ],
      "apple-mobile-web-app-title": "StimulusReflex Expo",
      "application-name": "StimulusReflex Expo",
      "msapplication-TileColor": "#da532c",
      "theme-color": "#ffffff",
      og: {
        title: :title,
        type: "website",
        url: request.fullpath,
        image: :image_src,
        site_name: "StimulusReflex Expo",
        locale: "en_US"
      },
      twitter: {
        card: "photo",
        site: "@hopsoft"
      },
      viewport: "width=device-width, initial-scale=1, shrink-to-fit=no"
    )
  end
end
