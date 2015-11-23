require 'rails_helper'
RSpec.describe Api::V1::QuestionsController, type: :request do

    before :each do
        @token = FactoryGirl.create(:token, expires_at: DateTime.now + 1.month)
        @poll = FactoryGirl.create(:poll_with_questions, user: @token.user)
    end
    
    describe 'GET /polls/:poll_id/questions' do

        before :each do
            get "/api/v1/polls/#{@poll.id}/questions"
        end
        
        it{ expect(response).to have_http_status(200) }
        
        it 'mande la lista de preguntas para la encuesta' do
            json = JSON.parse(response.body)
            expect(json.length).to eq(@poll.questions.count)    
        end

        it 'manda la descripción y id de la pregunta' do
            json_array = JSON.parse(response.body)
            json = json_array[0]
            expect(json.keys).to contain_exactly('id', 'description')
        end

        
        
    end
end