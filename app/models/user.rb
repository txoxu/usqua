# frozen_string_literal: true

# userに関するモデル
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :user_providers, dependent: :destroy
  has_many :whiskeys, dependent: :destroy
  has_many :cocktail_tastings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_cocktails, through: :bookmarks, source: :cocktail
  has_many :user_whiskey_badges, dependent: :destroy
  has_many :whiskey_badges, through: :user_whiskey_badges
  has_many :user_cocktail_badges, dependent: :destroy
  has_many :cocktail_badges, through: :user_cocktail_badges

  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                  format: {with: /\A[^@\s]+@[^@\s]+\.com\z/, message: "必ず@sample.comの形式で入力してください"}
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :password, presence: true, uniqueness: true, length: { minimum: 6 }

  # snsから取得した、providerとuidを使って、既存ユーザーを検索
  def self.from_omniauth(auth)
    user_provider = UserProvider.where(provider: auth.provider, uid: auth.uid).first_or_create

    # snsのuser or usersテーブルに対し、SNS認証で取得したメールアドレスが登録済みの場合は、取得 or なければビルド(保存はしない)
    user = user_provider.user || User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      # ユーザーが存在する場合、UserProviderに関連付けて保存
      user_provider.user = user
      user_provider.save!
    end
    { user:, user_provider: } # user、snsをハッシュで返す(コントローラーがこれを受け取る)
  end

  def bookmark(cocktail)
    bookmark_cocktails << cocktail
  end

  def unbookmark(cocktail)
    bookmark_cocktails.destroy(cocktail)
  end

  def bookmark?(cocktail)
    bookmark_cocktails.include?(cocktail)
  end

  def assign_badge(badge)
    # もし、ユーザーが獲得したバッジ(中間テーブル)に今回取得した称号がないのであれば
    return if user_whiskey_badges.exists?(whiskey_badge: badge)

    # ユーザーの獲得したバッジを作成する
    user_whiskey_badges.create(whiskey_badge: badge)
  end

  # 上のウイスキーのカクテル版
  def assign_cocktail_badge(badge)
    return if user_cocktail_badges.exists?(cocktail_badge: badge)

    user_cocktail_badges.create(cocktail_badge: badge)
  end
end
