Rails.application.routes.draw do

  get 'cars/index'

  get 'cars/edit'

  get 'cars/new'

  get 'cars/show'

  get 'cars/_form'

  get 'cars/_index'

  resources :coordinators, only: [:index, :show, :edit, :update]

  resources :enterprises, only: [:index, :show, :edit, :update] do
    resources :drivers
    resources :cars, except: :index
    resources :car_drivers
  end


  resources :tutors, only: [:index, :show, :edit, :update] do
    resources :students do
      resources :trips, only: :index
    end
  end



  root 'homes#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
