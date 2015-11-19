Rails.application.routes.draw do
  root to: "pages#show", id: 'index/home'

  resources :landscapes do
    post 'crop', :on => :member
  end

  get 'secret/show'

  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_scope :user do
    get 'users/sign_up_success', to: "users/registrations#success", as: 'sign_up_success'
  end

  # User profiles
  get 'profiles/:slug' => 'profiles#show', as: :user_profile
  get 'profiles/:slug/edit' => 'profiles#edit', as: :user_setting
  get 'profiles/:slug/crop' => 'profiles#crop', as: :avatar_crop

  match 'profiles/:slug/crop' => 'profiles#do_crop', via: [:put, :patch]
  match 'profiles/:slug/edit' => 'profiles#update', via: [:put, :patch]

  get "/pages/*id" => 'pages#show', as: :page, format: false

  mount ChinaCity::Engine => '/china_city'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
