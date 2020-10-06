require 'redmine'

Rails.logger.info 'o:=>'
Rails.logger.info 'o:=> Starting Redmine Greentech Plugin for Redmine'

Redmine::Plugin.register :redmine_greentech do
  name 'Redmine Custom greentech features plugin'
  author 'Tomislav Kramaric'
  version '0.1'
  description 'Add Custom greentech features'
  url 'https://github.com/Tomislav2/greentech'
  author_url 'https://www.tomislav.net'
  requires_redmine :version_or_higher => '4'
end


Rails.application.config.to_prepare do
  require_dependency 'greentech_issues_helper_patch'
end
