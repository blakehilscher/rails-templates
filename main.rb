def shout(text)
  p "\n"
  p "========================"
  p text
  p "========================"
  p "\n"
end

def ask_for(recipe)
  ask("Do you want to install #{recipe}? (y/n)") == "y"
end

def inject_javascript_before_require_tree(text)
  inject_into_file 'app/assets/javascripts/application.js', :before => "\n//= require_tree .\n" do
    "\n#{text}"
  end
end

###########
# OPTIONS #
###########

@options = {}
@options[:bootstrap] = ask_for 'Twitter Bootstrap'
@options[:devise] = ask_for 'Devise'
@options[:heroku] = ask_for 'Heroku'
@options[:testing] = ask_for 'Cucumber & Capybara'

#########
# PATHS #
#########

@template_root  = File.expand_path(File.join(File.dirname(__FILE__)))
@recipes        = File.join(@template_root, 'recipes')


###########
# RM JUNK #
###########

run "rm -Rf public/index.html app/assets/images/rails.png public/javascripts/* app/views/layouts/*"


########
# GEMS #
########

gem 'haml-rails'
gem 'execjs', :group => :assets
gem 'jquery-rails'
gem "factory_girl_rails", :group => [:test, :test]
gem "faker", :group => [:test, :test]
gem "shoulda", :group => [:test, :shoulda]


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

git :init
git :add => '.'
git :commit => '-am "Initial commit"'


###########
# RECIPES #
###########

apply "#{@recipes}/development.rb"
apply "#{@recipes}/testing.rb" if @options[:testing]
apply "#{@recipes}/heroku.rb" if @options[:heroku]

apply "#{@recipes}/assets/html5.rb"
apply "#{@recipes}/assets/javascripts.rb"
apply "#{@recipes}/assets/stylesheets.rb"
apply "#{@recipes}/assets/bootstrap.rb" if @options[:bootstrap]
apply "#{@recipes}/assets/ckeditor.rb"


apply "#{@recipes}/simple_form.rb"
apply "#{@recipes}/devise.rb" if @options[:devise]

puts "Template Built Successfully!"