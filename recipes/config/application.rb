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

copy_template "app/helpers/application_helper.rb"