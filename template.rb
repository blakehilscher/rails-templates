# PATHS
@path_root    = File.expand_path(File.join(File.dirname(__FILE__)))
@path_recipes = File.join(@path_root, 'recipes')
@path_templates = File.join(@path_root, 'templates')

# LIBS
require File.join(@path_root, "load_paths.rb")

#####################
# CONFIGURE RECIPES #
#####################

recipes = [
  'config/rvmrc',
  'remove_junk',
  'config/application',
  'gems/defaults',
  'gems/development',
  'app/assets/html5',
  'app/assets/javascripts',
  'app/assets/stylesheets',
  'app/controllers/site_controller',
  ]
  
recipes_requiring_confirmation = [
  'gems/cucumber', 
  'gems/heroku', 
  'app/assets/bootstrap',
  'app/assets/ckeditor',
  'gems/simple_form', 
  {'gems/devise' => 
    [
      'app/controllers/admin_controller',
      'app/controllers/admin/pages_controller',
    ]},
  ]

#################
# APPLY RECIPES #
#################

git :init

# confirm optional recipes
confirm_each_recipe(recipes_requiring_confirmation) unless ask("Install template using defaults? (y/n)") == 'y'

# execute required recipes
recipes.each { |recipe| apply_recipe(recipe)  }
# execute confirmed recipes
apply_confirmed_recipes recipes_requiring_confirmation

shout "Template Built Successfully!"