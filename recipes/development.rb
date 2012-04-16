gem "rails-erd", :group => :development
gem 'awesome_print', :group => :development
gem "rails3-generators", :group => :development, :git => "https://github.com/neocoin/rails3-generators.git"

run "bundle update"

git :add => '.'
git :commit => '-am "Development Tools"'

shout "Development Tools finished building."