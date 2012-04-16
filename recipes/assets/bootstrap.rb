########
# GEMS #
########

gem 'bootstrap-sass', '~> 2.0.2', :group => :assets

run "bundle update"


############
# GENERATE #
############

# SASS
prepend_file 'app/assets/stylesheets/application.css.scss', "@import \"bootstrap\";\n\n"
inject_javascript_before_require_tree "//= require bootstrap"

finished :bootstrap