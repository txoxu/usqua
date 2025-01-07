# frozen_string_literal: true

Rails.application.routes.draw do
  draw :devise_routes
  draw :static_pages_routes

  # バッジの更新
  post 'update_badge_seen', to: 'whiskeys#update_badge_seen'
  post 'update_cocktail_badge_seen', to: 'cocktails#update_cocktail_badge_seen'
  # ユーザー関連のルーティング
  resources :users, only: %i[show edit update destroy]
  # カクテル関連のルーティング
  resources :cocktails do
    resources :cocktail_tastings, except: %i[index show]
    collection { get :bookmarks }
  end
  # ブックマークのルーティング
  resources :bookmarks, only: %i[create destroy]
  # ウイスキー関連のルーティング
  resources :whiskeys do
    member { get 'choose_next_step' }
    resources :tastings, except: %i[index show]
  end
  # 蒸留所のルーティング
  resources :distilleries, only: :index
  # 問い合わせフォームのルーティング
  resources :contacts, only: %i[new create] do
    collection do
      post 'confirm', 'back'
      get 'confirm', to: redirect('/contacts/new')
      get 'done'
    end
  end
end
