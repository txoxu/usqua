# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#top'
  get 'home', to: 'pages#home'
  get 'mypage', to: 'pages#mypage'
  get 'explanation', to: 'static_pages#explanation'
end
