Rails.application.routes.draw do
#para cuando se busca localhost:3000 muestra la pantalla inicial
    

  get '/', to: 'welcome#app', constraints: lambda{ |solicitud| !solicitud.session[:user_id].blank? }
  get '/', to: 'welcome#index'



  resources :my_apps, except: [:show, :index]

    namespace :api, defaults: {format: 'json'} do
        namespace :v1 do
            resources :users, only: [:create]
#mapea todo lo que llega a polls 
#hacia el controlador my_polls, 
#para no tener que usar my_polls en las rutas
#los except, indica que se van a obviar las vistas para esas peticiones
            resources :polls, controller: 'my_polls', except: [:new, :edit] do
            	resources :questions, except: [:new, :edit]
            	resources :answers, only: [:update, :destroy, :create]
            end
            resources :my_answers, only: [:create]
            match "*unmatched", via: [:options], to: "master_api#xhr_options_request"            
        end
    end

    
    #url por donde la API de google retorna el hash con la info del usuario
    get '/auth/:provider/callback', to: 'sessions#create'
    #
    delete '/logout', to: 'sessions#destroy'

end
