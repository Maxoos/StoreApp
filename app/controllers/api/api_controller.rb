module Api
  class ApiController < ApplicationController
    unless Rails.env.development?
      rescue_from Exception, :with => :render_error
      rescue_from ActiveRecord::RecordInvalid, :with => :render_error
      rescue_from ActiveRecord::RecordNotFound, :with => :render_error
    end

    def render_error(exception)
      render :json => { :error_message => exception.to_s, :code => 422 }, :status => :unprocessable_entity
    end

    def render_bad_request error_message
      render :json => {:error_message => error_message, :code => 400}, :status => :bad_request
    end

  end
end

