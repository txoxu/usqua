# frozen_string_literal: true

  root 'static_pages#top'
  get 'select', to: 'static_pages#select'
  get 'home', to: 'pages#home'
  get 'mypage', to: 'pages#mypage'
  get 'explanation', to: 'static_pages#explanation'
