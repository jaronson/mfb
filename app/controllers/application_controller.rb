class ApplicationController < ActionController::Base
  include Refinery::Blog::ControllerHelper

  helper :'refinery/blog/posts'

  protect_from_forgery

  before_filter :load_all_blog_categories

  def load_all_blog_categories
    @categories = Refinery::Blog::Category.all
  end
end
