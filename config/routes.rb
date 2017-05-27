Rails.application.routes.draw do
  scope '/api' do
    concern :wordable do
      resources :words do
        resources :translations
        resources :adnotations
        resources :categories, only: [:create]
      end
    end

    resources :languages do
      concerns :wordable
      resources :sections do
        concerns :wordable
      end
      resources :categories do
        concerns :wordable
      end
    end
  end
end
