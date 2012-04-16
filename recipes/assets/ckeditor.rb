########
# GEMS #
########

gem "ckeditor", "3.7.0.rc3", :group => :assets 
gem "carrierwave"
gem "mini_magick"

run "bundle update"


############
# GENERATE #
############

generate "ckeditor:install --orm=active_record --backend=carrierwave" 
inject_javascript_before_require_tree "//= require ckeditor/init"

rake("db:migrate")

git :add => '.'
git :commit => '-m "ckeditor"'