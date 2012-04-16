#########
# PATHS #
#########

@template_root  = File.expand_path(File.join(File.dirname(__FILE__)))
@recipes        = File.join(@template_root, 'recipes')


########
# LIBS #
########

require "#{@template_root}/libs/helpers.rb"


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
# START #
#########

# Remove Junk
run "rm -Rf public/index.html app/assets/images/rails.png public/javascripts/* app/views/layouts/*"

# Base Gemset
apply "#{@template_root}/gemset.rb"

# Init Git Repository
git :init
git :add => '.'
git :commit => '-am "Initial commit"'


###########
# RECIPES #
###########

apply "#{@recipes}/development.rb"
apply "#{@recipes}/testing.rb" if option :testing
apply "#{@recipes}/heroku.rb" if option :heroku

apply "#{@recipes}/assets/html5.rb"
apply "#{@recipes}/assets/javascripts.rb"
apply "#{@recipes}/assets/stylesheets.rb"
apply "#{@recipes}/assets/bootstrap.rb" if option :bootstrap
apply "#{@recipes}/assets/ckeditor.rb" if option :ckeditor

apply "#{@recipes}/simple_form.rb" if option :simple_form
apply "#{@recipes}/devise.rb" if option :devise

puts "Template Built Successfully!"