def apply_recipe_with_confirmation(recipe)
  apply_recipe(recipe) if confirmation(recipe.keyize)
end

def apply_recipe(key)
  apply File.join( @path_recipes, "#{key}.rb" )
  shout_and_commit(key)
end

def ask_for_confirmation(recipe)
  @confirmations ||= {}
  @confirmations[recipe.keyize] = ask_for(recipe)
end

def ask_for(recipe)
  ask("Do you want to install #{recipe}? (y/n)") == "y"
end

def confirmations
  @confirmations ||= {}
end
def confirmation(key)
  !confirmations.has_key?(key) || confirmations[key]
end

def shout_and_commit(key)
  message = "Recipe: #{key}."
  git :add => '.'
  git :commit => "-am \"#{message}\""
  shout message + ' finished running.'
end

def shout(text)
  puts "\r\n\r\n*****************************************************************************************************\r\n*"
  puts "*\t#{text}"
  puts "*\r\n*****************************************************************************************************\r\n\r\n"
end

# Copy a static file from the template into the new application
def copy_template(*args)
  args.each do |path|
    # puts "Installing #{path}...".magenta
    remove_file path
    file path, File.read(File.join(@path_templates, path))
    # puts "\n"
  end
end

def inject_javascript_before_require_tree(text)
  inject_into_file 'app/assets/javascripts/application.js', :before => "\n//= require_tree ." do
    "\n#{text}"
  end
end
