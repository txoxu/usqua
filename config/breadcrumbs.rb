crumb :whiskey do |whiskey|
  link 'ウイスキー詳細', whiskey_path(whiskey)
end

crumb :edit_whiskey do |whiskey|
  link 'ウイスキー編集', edit_whiskey_path(whiskey)
  parent :whiskey, whiskey
end

crumb :whiskey_tasting do |tasting|
  link 'テイスティング詳細', whiskey_tasting_path(tasting)
  parent :whiskey, whiskey
end

crumb :edit_whiskey_tasting do |tasting|
  link 'テイスティング編集', edit_whiskey_tasting_path
  parent :whiskey_tasting, whiskey_tasting
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
