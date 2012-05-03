copy_template 'app/controllers/admin_controller.rb','app/controllers/admin/pages_controller.rb'
route <<-ROUTES

  namespace :admin do
    root :to => 'pages#dashboard'
    resources :posts
  end
ROUTES