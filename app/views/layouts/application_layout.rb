class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def view_template(&block)
    doctype

    html do
      head do
        title { plain(content_for(:title) || "Coloc") }
        meta name: "viewport", content: "width=device-width,initial-scale=1"
        csp_meta_tag
        csrf_meta_tags

        yield :head

        stylesheet_link_tag "tailwind", data_turbo_track: "reload"
        stylesheet_link_tag "application", data_turbo_track: "reload"
        javascript_importmap_tags
      end

      body do
        div(class: "container mx-auto mt-28 px-5 flex") {
          block.call
        }
      end
    end
  end
end
