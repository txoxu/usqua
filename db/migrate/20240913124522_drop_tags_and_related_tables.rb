class DropTagsAndRelatedTables < ActiveRecord::Migration[7.1]
  def change
    # まずは中間テーブルを削除
    drop_table :category_tags
    drop_table :tasting_tags
    
    # 次にtagsテーブルを削除
    drop_table :tags
  end
end
