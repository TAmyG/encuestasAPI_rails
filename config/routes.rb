Rails.application.routes.draw do
    namespace :api, defaults: {format: 'json'} do
        namespace :v1 do
            resources :users, only: [:create]
#mapea todo lo que llega a polls 
#hacia el controlador my_polls, 
#para no tener que usar my_polls en las rutas
#los except, indica que se van a obviar las vistas para esas peticiones
            resources :polls, controller: 'my_polls', except: [:new, :edit] do
            	resources :questions, except: [:new, :edit]
            end            
        end
    end
end
