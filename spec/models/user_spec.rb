require 'rails_helper'

RSpec.describe User, type: :model do
    it { should validate_presence_of(:email) }
    it {should_not allow_value("tamy@gmail").for(:email)}
    it {should allow_value("tamy.vivas@gmail.com").for(:email)}
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:provider) }
    it { should validate_uniqueness_of(:email) }
    
    it 'deberia crear un usuario si uid y provider no existen' do        
        expect{
            User.from_omniauth({
                uid: "12345",
                provider: "facebook", 
                info: {email: 'tam@gmail.com'}
            })
        }.to change(User,:count).by(1)
    end
    
    it 'deberia encontrar un usuario si uid y provider existen' do 
        user = FactoryGirl.create(:user)
        expect{
            User.from_omniauth(
                {
                    uid: user.uid, 
                    provider: user.provider
                    #info: {email: 'tam@gmail.com'}
                })
        }.to change(User, :count).by(0)            
    end
    
    it 'retornar usuario cuando lo encuentre' do
        user = FactoryGirl.create(:user)
        expect(
            User.from_omniauth(
                {
                    uid: user.uid, 
                    provider: user.provider
                })
            ).to eq(user)        
    end
end
