Rails.application.routes.draw do

  resources :landscapes do
    post 'crop', :on => :member
  end

  get 'secret/show'

  devise_for :users

  # User profiles
  get 'profiles/:slug' => 'profiles#show', as: :user_profile
  get 'profiles/:slug/edit' => 'profiles#edit', as: :user_setting
  get 'profiles/:slug/crop' => 'profiles#crop', as: :avatar_crop

  match 'profiles/:slug/crop' => 'profiles#do_crop', via: [:put, :patch]
  match 'profiles/:slug/edit' => 'profiles#update', via: [:put, :patch]

  mount ChinaCity::Engine => '/china_city'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
