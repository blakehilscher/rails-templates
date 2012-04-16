def ask_for(recipe)
  ask("Do you want to install #{recipe}? (y/n)") == "y"
end

def inject_javascript_before_require_tree(text)
  inject_into_file 'app/assets/javascripts/application.js', :before => "\n//= require_tree ." do
    "\n#{text}"
  end
end

def shout_finished(text)
  shout "#{text.capitalize} finished installing."
end

def shout(text)
  puts "\r\n\r\n*****************************************************************************************************\r\n\r\n"
  puts "#{text}"
  puts "\r\n*****************************************************************************************************\r\n\r\n"
end

def option(key)
  @options[key]
end