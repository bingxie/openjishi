Rails.application.routes.draw do
  root to: "pages#show", id: 'index/home'

  resources :products, only: [:new, :edit, :create, :show] do
    member do
      get 'preview'
      get 'to_taobao'
      put 'publish'
    end
  end

  resources :product_images, only: [:index, :create, :destroy]

  resources :categories, only: [:show]

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    passwords: 'users/passwords' }

  devise_scope :user do
    get 'users/sign_up_success', to: "users/registrations#success", as: 'sign_up_success'
  end

  # User profiles
  get 'profiles/:slug/edit' => 'profiles#edit', as: :user_setting
  post 'profiles/:slug/upload' => 'profiles#upload', as: :avatar_upload

  match 'profiles/:slug/crop' => 'profiles#crop', as: :avatar_crop, via: [:put, :patch]
  match 'profiles/:slug/edit' => 'profiles#update', via: [:put, :patch]

  # Static pages
  get "/pages/*id" => 'pages#show', as: :page, format: false

  mount ChinaCity::Engine => '/china_city'

  # For demo
  resources :landscapes do
    post 'crop', :on => :member
  end

  get 'secret/show'

  # Development Only
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
