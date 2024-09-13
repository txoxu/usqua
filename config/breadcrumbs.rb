crumb :mypage do
  link 'マイページ', mypage_path
end

crumb :new_whiskey do
  link 'ウイスキー登録', new_whiskey_path
  parent :mypage
end

crumb :whiskeys do
  link 'ウイスキー一覧', whiskeys_path
  parent :mypage
end

crumb :new_tasting do |whiskey|
  link 'テイスティング登録', new_whiskey_tasting_path(whiskey)
  parent :whiskeys
end

crumb :edit_whiskey do |whiskey|
  link 'ウイスキー編集', edit_whiskey_path(whiskey)
  parent :whiskeys
end


#crumb :edit_whiskey_tasting do |tasting|
#  link 'テイスティング編集', edit_whiskey_tasting_path(tasting)
#  parent :whiskey_tasting, tasting
#end

crumb :cocktails do
  link 'カクテル一覧', cocktails_path
  parent :mypage
end

crumb :cocktail do |cocktail|
  link 'カクテル詳細', cocktail_path(cocktail)
  parent :cocktails
end

crumb :cocktail_tasting do |cocktail|
  link 'カクテルテイスティング登録', new_cocktail_cocktail_tasting_path(cocktail)
  parent :cocktail, cocktail
end

crumb :distilleries do
  link '蒸留所一覧', distilleries_path
  parent :mypage
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
