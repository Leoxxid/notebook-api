Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :auths, only: [:create]

  api_version(:module => "v1", :path => {:value => "v1"}) do
    resources :contacts do
      resource :kind, only: %i[ show ]
      resource :kind, only: %i[ show ], path: 'relationships/kind'

      resource :phones, only: %i[ show ]
      resource :phones, only: %i[ show ], path: 'relationships/phones'

      resource :phone, only: %i[ create update destroy ]
      resource :phone, only: %i[ create update destroy ], path: 'relationships/phones'

      resource :address, only: %i[ show update create destroy]
      resource :address, only: %i[ show update create destroy], path: 'relationships/address'
    end
  end

  api_version(:module => "v2", :path => {:value => "v2"}) do
    resources :contacts do
      resource :kind, only: %i[ show ]
      resource :kind, only: %i[ show ], path: 'relationships/kind'

      resource :phones, only: %i[ show ]
      resource :phones, only: %i[ show ], path: 'relationships/phones'

      resource :phone, only: %i[ create update destroy ]
      resource :phone, only: %i[ create update destroy ], path: 'relationships/phones'

      resource :address, only: %i[ show update create destroy]
      resource :address, only: %i[ show update create destroy], path: 'relationships/address'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
