# PATHS
@path_root    = File.expand_path(File.join(File.dirname(__FILE__)))
@path_recipes = File.join(@path_root, 'recipes')
@path_templates = File.join(@path_root, 'templates')

# LIBS
require File.join(@path_root, "libs/helpers.rb")


###########
# OPTIONS #
###########

@options = {}
if ask("Install using defaults? (y/n)") == 'y'
  def option(key)
    true
  end
else
  @options[:bootstrap] = ask_for 'Twitter Bootstrap'
  @options[:devise] = ask_for 'Devise'
  @options[:heroku] = ask_for 'Heroku'
  @options[:testing] = ask_for 'Cucumber & Capybara'
  @options[:ckeditor] = ask_for 'CK Editor'
  @options[:simple_form] = ask_for 'Simple Form'
end

#########
# BEGIN #
#########

# Remove Junk
run "rm -Rf public/index.html app/assets/images/rails.png public/javascripts/* app/views/layouts/*"

# Base Gemset
apply "#{@path_root}/gemset.rb"
apply "#{@path_root}/config.rb"

# Init Git Repository
git :init
git :add => '.'
git :commit => '-am "Initial commit"'


###########
# RECIPES #
###########

apply "#{@path_recipes}/development.rb"
apply "#{@path_recipes}/testing.rb" if option :testing
apply "#{@path_recipes}/heroku.rb" if option :heroku

apply "#{@path_recipes}/assets/html5.rb"
apply "#{@path_recipes}/assets/javascripts.rb"
apply "#{@path_recipes}/assets/stylesheets.rb"
apply "#{@path_recipes}/assets/bootstrap.rb" if option :bootstrap
apply "#{@path_recipes}/assets/ckeditor.rb" if option :ckeditor

apply "#{@path_recipes}/simple_form.rb" if option :simple_form
apply "#{@path_recipes}/devise.rb" if option :devise

puts "Template Built Successfully!"