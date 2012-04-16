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

git :add => '.'
git :commit => '-m "SASS boilerplate"'

shout_finished :stylesheets