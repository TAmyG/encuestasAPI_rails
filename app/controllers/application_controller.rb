class ApplicationController < ActionController::Base

    include UserAuthentication
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    #protect_from_forgery with: :null_session


    
    #before_action: authenticate
    before_action :set_jbuilder_defaults
    
    #    Cualquier método definido aquí, 
    #    es heredado hacia los demas controladores
    
    protected
    
    def authenticate
        #@current_user = User.first
        token_str = params[:token]
        token = Token.find_by(token: token_str)
        
        if token.nil? or not token.is_valid? or not @my_app.is_your_token?(token)
            error!("Tu token es inválido", :unauthorized)
        else
            @current_user = token.user
        end
    end

    def set_jbuilder_defaults
        @errors = []
    end

    def error!(message, status)
        @errors << message
        response.status = status
        render template: "api/v1/errors"
    end

    def error_array!(array, status)
        @errors = @errors + array
        response.status = status
        render  "api/v1/errors"
    end


    def authenticate_owner(owner)
        if owner != @current_user
           render json: {errors: 'no tiene autorizado editar el recuurso'}, status: 401
        end
    end
end
