class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_all_blog_categories

  def load_all_blog_categories
    @categories = Refinery::Blog::Category.all
  end
end
