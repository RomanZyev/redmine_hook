require 'redmine'

Redmine::Plugin.register :redmine_hook do
  name 'Redmine Hook plugin'
  author 'Roman Zyev'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/RomanZyev/redmine_hook'
  author_url 'https://github.com/RomanZyev'

  settings :default => {'empty' => true}, :partial => 'settings'
end

# Hooks
require_dependency 'patches/hooks/view_hook'