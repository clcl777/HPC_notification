Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'profiles/index'
  get 'home' => 'home#top'
  post 'callback' => 'line_bot#callback'
  get 'notification/:id/:job_id/:job_name/:computer_name' => 'line_bot#notification'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
