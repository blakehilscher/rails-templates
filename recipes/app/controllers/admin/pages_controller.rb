generate "model Page title:string content:text slug:string is_virtual:boolean page_id:integer"

copy_template 'app/controllers/pages_controller.rb','app/controllers/admin/pages_controller.rb' 

route <<-ROUTES
  
  resources :pages, :only => [:show, :index]  
ROUTES
inject_into_file 'config/routes.rb', :after => "  namespace :admin do\n" do
  "resources :pages"
end

directory "app/views/admin/pages"
directory "app/views/pages"