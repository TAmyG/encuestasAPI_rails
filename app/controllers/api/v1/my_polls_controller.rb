class Api::V1::MyPollsController < ApplicationController
    
    def index
        @polls = MyPoll.all
    end
    
    def show
        @poll = MyPoll.find(params[:id])
    end
    
    def create
    end
    
    def update
    end
    
    def destroy
    end
        
end
    