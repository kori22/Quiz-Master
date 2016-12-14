Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "subjects#index"

  resources :subjects do
  	resources :questions
  	resources :answers
  end

end
