# Copy a static file from the template into the new application
def copy_template(*args)
  args.each do |path|
    # puts "Installing #{path}...".magenta
    remove_file path
    file path, File.read(File.join(@path_templates, path))
    # puts "\n"
  end
end

def ask_for(recipe)
  ask("Do you want to install #{recipe}? (y/n)") == "y"
end

def inject_javascript_before_require_tree(text)
  inject_into_file 'app/assets/javascripts/application.js', :before => "\n//= require_tree ." do
    "\n#{text}"
  end
end

def finished(key)
  git :add => '.'
  git :commit => "-am \"#{key.capitalize}\""
  shout "#{key.capitalize} finished installing."
end

def shout_finished(text)
  
end

def shout(text)
  puts "\r\n\r\n*****************************************************************************************************\r\n\r\n"
  puts "#{text}"
  puts "\r\n*****************************************************************************************************\r\n\r\n"
end

def option(key)
  @options[key]
end