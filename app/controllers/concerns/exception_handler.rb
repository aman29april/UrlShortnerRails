module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from UrlSanitizer::InvalidUrl do |exception|
      flash[:error] = "Invalid Url"
      respond_to do |format|
        format.html { redirect_to :root }
        format.json {render json: {error: 'invalid format', status: 422} }
      end
    end
  end

  def render_error_page(status:, text:, template: 'errors/error')
    respond_to do |format|
      format.html { render template: template, status: status, layout: false }
      format.json {render json: {error: text, status: status} }
    end
  end

end
