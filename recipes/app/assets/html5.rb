########
# GEMS #
########

gem 'compass-rails', :group => :assets
gem 'compass-h5bp', :group => :assets
gem 'html5-rails'

run "bundle update"


############
# GENERATE #
############

# HTML5
generate "html5:install"
generate "html5:partial --all"

copy_template 'app/views/application/_flashes.html.haml', 'app/views/application/_header.html.haml', 'app/views/layouts/application.html.haml'