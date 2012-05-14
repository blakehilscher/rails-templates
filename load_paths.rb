# LIBS
libs = File.expand_path(File.join(File.dirname(__FILE__), 'libs'))
require File.join(libs, "core_ext.rb")
require File.join(libs, "helpers.rb")

module Thor::Actions
  def source_paths
    [File.expand_path(File.join(File.dirname(__FILE__), 'templates'))]
  end
end