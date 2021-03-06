class Api::V1::UsersController < Api::V1::MasterApiController
    #POST /users
    def create
        #params = {auth:{provider: , uid:}}

        #si no se envían los parámetros en el post
        #entonces se responde con un msj de error
        if !params[:auth]
            render json: {error: 'Auth param is missing'}
        else
            @user = User.from_omniauth(params[:auth])        
            @token = @user.tokens.create(my_app: @my_app)
            #renderiza hacia la vista segun la ruta de abajo
            render 'api/v1/users/show'
        end
    end    
end