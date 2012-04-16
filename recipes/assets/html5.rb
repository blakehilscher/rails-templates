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

copy_template_file 'app/views/application/_flashes.html.haml', 'app/views/application/_header.html.haml', 'app/views/layouts/application.html.haml'

git :add => '.'
git :commit => '-m "HTML5 boilerplate"'



shout_finished :html5