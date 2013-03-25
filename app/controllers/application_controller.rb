class ApplicationController < ActionController::Base
  include Refinery::Blog::ControllerHelper

  helper :'refinery/blog/posts'

  protect_from_forgery

  before_filter :load_all_blog_categories

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => lambda{|e| render_error 500, e }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |e| render_error 404, e }
  end

  def load_all_blog_categories
    @categories = Refinery::Blog::Category.all
  end

  private
  def render_error(status, exception)
    respond_to do |format|
      format.html { render :template => "errors/error_#{status}", :layout => 'layouts/application', :status => status }
      format.all { render :nothing => true, :status => status }
    end
  end
end
