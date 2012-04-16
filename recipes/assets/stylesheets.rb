########
# GEMS #
########

gem 'compass-rails', :group => :assets
gem 'scss-boilerplate-rails', :group => :assets

run "bundle update"


############
# GENERATE #
############

# SASS
generate "scss_boilerplate:install -f"

finished :stylesheets