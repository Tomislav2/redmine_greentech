require 'redmine'

Redmine::Plugin.register :redmine_greentech do
  name 'Redmine greentech plugin'
  author 'Tomislav Kramaric'
  version '0.1'
  description 'Add the ability to create links to local folders'
  url 'https://github.com/Tomislav2/redmine_greentech'
  author_url 'https://www.tomislav.net'
  requires_redmine :version_or_higher => '4'
end


Rails.application.config.to_prepare do
  require_dependency 'greentech_issues_helper_patch'
end
