########
# GEMS #
########

gem "simple_form"
gem "show_for"
gem 'kaminari'

run "bundle update"


############
# GENERATE #
############

generate "simple_form:install -e haml #{'--bootstrap' if confirmation('app/assets/bootstrap'.keyize)}"
generate "show_for:install"
file "lib/templates/haml/scaffold/show.html.haml", <<-FILE
= show_for @<%= singular_name %> do |s|
<% attributes.each do |attribute| -%>
  = s.<%= attribute.reference? ? :association : :attribute %> :<%= attribute.name %>
<% end -%>

== \#{link_to 'Edit', edit_<%= singular_name %>_path(@<%= singular_name %>) } | \#{ link_to 'Back', <%= plural_name %>_path }
FILE