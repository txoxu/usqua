class ChangeImageColumnTypeInWhiskeys < ActiveRecord::Migration[7.1]
  def change
    change_column :whiskeys, :image, :string
  end
end
