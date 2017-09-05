require 'redmine'

Redmine::Plugin.register :redmine_hook do
  name 'Redmine Hook plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/RomanZyev/redmine_hook.git'
  author_url 'https://github.com/RomanZyev'

  settings :default => {'empty' => true}, :partial => 'settings_plugin'
end