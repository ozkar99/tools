Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    patch 'users' => 'devise/registrations#update', as: 'user_registration'
  end

  root to: 'home#index'

  # restricted routes
  authenticate :user do

    # passwords module
    resources :passwords do
      member do
        post 'copy_to_clipboard' => 'passwords#copy_to_clipboard'
      end
    end

  end

end
