class Api::V1::MyPollsController < ApplicationController
    
    before_action :authenticate, only: [:create, :update, :destroy]
    before_action :set_poll, only: [:show, :update, :destroy]
    before_action(only: [:update, :destroy]){ |controlador| controlador.authenticate_owner(@poll.user) }
    
    def index
        @polls = MyPoll.all
    end
    
    def show
        #al tener el set_poll no es necesario buscarlo ya
        #que el callback lo realiza
    end
    
    def create
        @poll = @current_user.my_polls.new(my_polls_params) 
        #poll =  MyPoll.new(my_polls_params)
        #poll.user = @current_user
        
        if @poll.save
            render "/api/v1/my_polls/show"
        else
            render json: {errors: @poll.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    def update
            @poll.update(my_polls_params)
            render "/api/v1/my_polls/show"
    end
    
    def destroy
            @poll.destroy
            render json: {message: 'se elimino la encuesta'}
    end

    protected

    def authenticate_owner(owner)
        if owner != @current_user
           render json: {errors: 'no tiene autorizado eliminar la encuesta'}, status: 401
        end
    end

    
    private

    def set_poll
        @poll = MyPoll.find(params[:id])
    end
    
    #cuida de obtener parametros maliciosos
    def my_polls_params
        params.require(:poll).permit(:title, :description, :expires_at)
    end
        
end
    