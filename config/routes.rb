MontessoriFromBirth::Application.routes.draw do
  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, :at => '/'

  Refinery::Core::Engine.routes.draw do 
    get '/'       => 'blog/posts#index'
    get '/admin'  => 'admin/dashboard#index'
    get '/search' => 'blog/posts#search', :as => 'search'
    get '/page_not_found' => 'errors#error_404', :as => 'not_found'
  end

  unless Rails.application.config.consider_all_requests_local
    match '*not_found', :to => 'errors#error_404'
  end
end
