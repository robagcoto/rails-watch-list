Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end

  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
