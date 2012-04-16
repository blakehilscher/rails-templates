########
# GEMS #
########

gem 'cucumber', "~> 0.10.0", :group => :test
gem 'cucumber-rails', "~> 0.3.2", :group => :test
gem 'capybara', "~> 0.4.1", :group => :test
gem 'database_cleaner', "~> 0.5.0", :group => :test
gem "pickle", "~> 0.4.2", :group => :test

run "bundle update"


############
# GENERATE #
############

generate "cucumber:install --capybara --testunit"
generate "pickle --path --email"

finished :testing