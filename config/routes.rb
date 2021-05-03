Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      # did
      post 'did' => 'did#create'
      get 'did/:suffix' => 'did#resolve'

      # sidetree
      post 'sidetree' => 'sidetree#operations'
      get 'sidetree/identifiers/:did-with-or-without-initial-state' => 'sidetree#resolve'
      get 'sidetree/version' => 'sidetree#version'

      # config
    end
  end

end
