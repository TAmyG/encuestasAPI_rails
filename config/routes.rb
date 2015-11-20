Rails.application.routes.draw do
    namespace :api, defaults: {format: 'json'} do
        namespace :v1 do
            resources :users, only: [:create]
#mapea todo lo que llega a polls 
#hacia el controlador my_polls, 
#para no tener que usar my_polls en las rutas
            resources :polls, controller: 'my_polls', except: [:new, :edit]
        end
    end
end
