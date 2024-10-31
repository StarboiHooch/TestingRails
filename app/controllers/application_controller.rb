class ApplicationController < ActionController::Base
  def render_error(message)
    @error_message = message
    render "shared/error", status: :not_found
  end
end
