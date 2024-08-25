class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :user_providers, dependent: :destroy
  has_many :whiskeys, dependent: :destroy
  has_many :cocktails
  has_many :cocktail_tastings
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_cocktails, through: :bookmarks, source: :cocktail

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)       # snsから取得した、providerとuidを使って、既存ユーザーを検索
    user_provider = UserProvider.where(provider: auth.provider, uid: auth.uid).first_or_create  # sns認証したことがあればアソシエーションで取得、なければSns_credentialsテーブルにレコード作成
  
    # snsのuser or usersテーブルに対し、SNS認証で取得したメールアドレスが登録済みの場合は、取得 or なければビルド(保存はしない)
    user = user_provider.user || User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?   # userが登録済みの場合：そのままログインするため、snsのuser_idを更新しとく
      user_provider.user = user
      user_provider.save
    end
    { user: user, user_provider: user_provider }   # user、snsをハッシュで返す(コントローラーがこれを受け取る)
  end
  

  def user_name
    "#{last_name} #{first_name}"
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

  private

  def password_confirmation_match
    errors.add(:password_confirmation, 'パスワードが一致していません') if password != password_confirmation
  end
end
