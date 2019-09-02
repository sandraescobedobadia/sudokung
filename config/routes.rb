Rails.application.routes.draw do
  resources :sudokus

  root to:'sudokus#new'
end
