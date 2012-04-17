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
  'remove_junk',
  'config/application',
  'gems/defaults',
  'gems/development',
  'app/assets/html5',
  'app/assets/javascripts',
  'app/assets/stylesheets',
  ]
  
recipes_requiring_confirmation = [
  'gems/cucumber', 
  'gems/heroku', 
  'app/assets/bootstrap', 
  'app/assets/ckeditor', 
  'gems/simple_form', 
  'gems/devise',
  ]

#################
# APPLY RECIPES #
#################

git :init

# confirm optional recipes
recipes_requiring_confirmation.each { |recipe| ask_for_confirmation(recipe) } unless ask("Install template using defaults? (y/n)") == 'y'
# execute required recipes
recipes.each { |recipe| apply_recipe(recipe)  }
# execute confirmed recipes
recipes_requiring_confirmation.each { |recipe| apply_recipe_with_confirmation(recipe) }

shout "Template Built Successfully!"