########
# GEMS #
########

def heroku(cmd, arguments="")
  run "heroku #{cmd} #{arguments}"
end

gem "heroku"

run "bundle update"


############
# GENERATE #
############

file ".slugignore", <<-EOS.gsub(/^  /, '')
  *.psd
  *.pdf
  test
  spec
  features
  doc
  docs
EOS

append_file 'config/environments/production.rb', 'Sass::Plugin.options[:never_update] = true'
run "cp config/environments/production.rb config/environments/staging.rb"