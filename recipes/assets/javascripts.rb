########
# GEMS #
########

gem 'haml_coffee_assets', :group => :assets

run "bundle update"


############
# GENERATE #
############

# JS
gsub_file 'app/assets/javascripts/application.js',"\n\n",''
inject_into_file 'app/assets/javascripts/application.js', :before => "\n//= require jquery\n" do
  "\n//= require hamlcoffee"
end
append_file 'app/assets/javascripts/application.js',"\n//= require_tree ."

git :add => '.'
git :commit => '-m "JS boilerplate"'

shout_finished :javascripts