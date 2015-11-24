require 'rails_helper'
RSpec.describe Api::V1::UsersController, type: :request do
    
    describe 'POST /users' do
        
        before :each do
            auth = {
                provider: 'facebook', 
                uid: '12345',
                info: {email: 't@gmail.com'}
            }
            post '/api/v1/users', {auth: auth}
        end
        
        it {have_http_status(200) }
        
        it { change(User, :count).by(1) }
        
        it 'response with the user found or creates' do
            json = JSON.parse(response.body)
            puts "#{response.body}"
            expect(json['email']).to eq('t@gmail.com')
        end
        
    end
    
end