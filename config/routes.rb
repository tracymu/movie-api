Rails.application.routes.draw do
  resources :favourites, only: [:index, :new, :create]
  get 'movies/search', as: :movie_search
  get 'movies/show'
end
