OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Remove unwanted files
run "rm -Rf public/index.html app/assets/images/rails.png public/javascripts/* app/views/layouts/*"

########
# GEMS #
########

# ASSETS
gem 'compass-rails', :group => :assets
gem 'compass-h5bp', :group => :assets
gem 'bootstrap-sass', '~> 2.0.2', :group => :assets
gem "ckeditor", "3.7.0.rc3", :group => :assets
gem 'scss-boilerplate-rails', :group => :assets
gem 'haml_coffee_assets', :group => :assets
gem 'execjs', :group => :assets

gem 'haml-rails'
gem 'jquery-rails'
gem 'html5-rails'

# VIEWS
gem "simple_form"
gem "show_for"

# MODELS
gem 'kaminari'

# ATTACH
gem "carrierwave"
gem "mini_magick"


# development
gem "rails-erd", :group => :development
gem 'awesome_print', :group => :development
gem 'rails3-generators', :group => :development

# testing
gem "factory_girl_rails", :group => [:test, :test]
gem "shoulda", :group => [:test, :shoulda]
gem "faker", :group => [:test, :test]

gem 'cucumber', "~> 0.10.0", :group => :test
gem 'cucumber-rails', "~> 0.3.2", :group => :test
gem 'capybara', "~> 0.4.1", :group => :test
gem 'database_cleaner', "~> 0.5.0", :group => :test
gem "pickle", "~> 0.4.2", :group => :test

run "bundle install"

application  <<-GENERATORS
  config.generators do |g|
      g.orm :active_record
      g.stylesheets false
      g.template_engine :haml
      g.test_framework  :shoulda, :fixture_replacement => :factory_girl
      g.fallbacks[:shoulda] = :test_unit
      g.integration_tool :test
      g.helper false
    end
GENERATORS


############
# CUCUMBER #
############

generate "cucumber:install --capybara --testunit"
generate "pickle --path --email"

generate "simple_form:install -e haml"
generate "show_for:install"
file "lib/templates/haml/scaffold/show.html.haml", <<-FILE
= show_for @<%= singular_name %> do |s|
<% attributes.each do |attribute| -%>
  = s.<%= attribute.reference? ? :association : :attribute %> :<%= attribute.name %>
<% end -%>

== \#{link_to 'Edit', edit_<%= singular_name %>_path(@<%= singular_name %>) } | \#{ link_to 'Back', <%= plural_name %>_path }
FILE

git :init
git :add => '.'
git :commit => '-am "Initial commit"'


###################
# GENERATE ASSETS #
###################

# HTML5
generate "html5:install"
generate "html5:partial --all"

# SASS
generate "scss_boilerplate:install -f"
prepend_file 'app/assets/stylesheets/application.css.scss', '@import "bootstrap";'

# JS
gsub_file 'app/assets/javascripts/application.js',"\n\n",''
append_file 'app/assets/javascripts/application.js',"\n//= require bootstrap"

git :add => '.'
git :commit => '-m "HTML5 & SASS & JS boilerplates"'


##########
# DEVISE #
##########

gem 'devise'
gem 'cancan'
gem 'hpricot', :group => :development
gem 'ruby_parser', :group => :development

run "bundle install"

generate "devise:install"
run "git clone https://github.com/blakehilscher/devise-haml app/views/devise; rm -rf app/views/devise/.git; rm app/views/devise/README"
generate "devise User"

git :add => '.'
git :commit => '-m "Devise"'


##########
# HEROKU #
##########

def heroku(cmd, arguments="")
  run "heroku #{cmd} #{arguments}"
end

gem "heroku"
run "bundle install"

file ".slugignore", <<-EOS.gsub(/^  /, '')
  *.psd
  *.pdf
  test
  spec
  features
  doc
  docs
EOS

# The system in heroku is read-only (except for log and tmp)
# Instead of letting the server compile the stylesheets when the requests hits the server
# we commit the compiled stylesheets to the git repo
# and tell compass to never compile
append_file 'config/environments/production.rb', 'Sass::Plugin.options[:never_update] = true'
run "cp config/environments/production.rb config/environments/staging.rb"

git :add => '.'
git :commit => "-a -m 'Configuration for heroku'"


puts "Template Built Successfully!"