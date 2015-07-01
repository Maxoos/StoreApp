module Api
  class ApiController < ApplicationController
    unless Rails.env.development?
      rescue_from Exception, :with => :unprocessable_entity
      rescue_from ActiveRecord::RecordInvalid, :with => :unprocessable_entity
      rescue_from ActiveRecord::RecordNotFound, :with => :unprocessable_entity
    end

    private

    def verify_user_authenticity!
      render_unauthorized unless user_signed_in?
    end

    def render_unauthorized
      render_error "Unauthorized", 401, :unauthorized
    end

    def render_bad_request message
      render_error message, 400, :bad_request
    end

    def render_unprocessable_entity(exception)
      render_error exception.to_s, 422, :unprocessable_entity
    end

    def render_error(message,code,status)
      render :json => { :error => {:message => message, :code => code} }, :status => status
    end

  end
end

