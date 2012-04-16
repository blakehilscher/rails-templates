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

git :add => '.'
git :commit => '-m "HTML5 boilerplate"'