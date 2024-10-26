class UpdateWhiskeyBadges < ActiveRecord::Migration[7.1]
  def change
    add_column :whiskey_badges, :badge_image, :string
  end
end
