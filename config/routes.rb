Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  root 'github#index'
  get '/github', to: 'github#index'
end
