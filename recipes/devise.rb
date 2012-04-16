##########
# DEVISE #
##########

gem 'devise'
gem 'cancan'
gem 'hpricot', :group => :development
gem 'ruby_parser', :group => :development

run "bundle update"

generate "devise:install"
run "git clone https://github.com/blakehilscher/devise-haml app/views/devise; rm -rf app/views/devise/.git; rm app/views/devise/README"
generate "devise User"

rake("db:migrate")

git :add => '.'
git :commit => '-m "Devise"'

shout "Devise finished building."