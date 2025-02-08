class ApplicationController < ActionController::Base
  include Phlexible::Rails::ActionController::ImplicitRender

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout -> { ApplicationLayout }

  def self.controller_path
    super&.delete_suffix('/')
  end
end
