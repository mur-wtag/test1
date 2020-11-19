# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'assets#shop'

  scope :owner do
    resources :assets, only: %i[index new create edit update destroy show] do
      get :buy
    end
  end
end
