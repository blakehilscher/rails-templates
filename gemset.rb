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