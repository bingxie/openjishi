Rails.application.routes.draw do

  get 'secret/show'

  devise_for :users

  # User profiles
  get 'profiles/:slug' => 'profiles#show', as: :user_profile
  get 'profiles/:slug/edit' => 'profiles#edit', as: :user_setting
  match 'profiles/:slug/edit' => 'profiles#update', via: [:put, :patch]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
