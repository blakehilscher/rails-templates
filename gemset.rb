########
# GEMS #
########

gem 'haml-rails'
gem 'execjs', :group => :assets
gem 'jquery-rails'
gem "factory_girl_rails", :group => [:test, :test]
gem "faker", :group => [:test, :test]
gem "shoulda", :group => [:test, :shoulda]
gem 'cancan'

run "bundle install"