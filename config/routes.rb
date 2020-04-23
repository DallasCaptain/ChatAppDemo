Rails.application.routes.draw do
resources :users
resources :chats do
  resources :messages
end

post '/chats/:id/adduser' => 'chats#addUser'
post '/chats/:id/removeuser' => 'chats#removeUser'

get '/login' => 'sessions#new' 
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

end
