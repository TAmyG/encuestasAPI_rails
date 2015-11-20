class User < ActiveRecord::Base
    validates :email, presence: true, email:true
    validates :uid, presence: true
    validates :provider, presence: true
    has_many :tokens
    
    def self.from_omniauth(data)
#Recibir hash de datos
# { provider: 'google', uid: '12345', info: { email: 'uriel...', name: 'Uriel' }  }
        User.where(provider: data[:provider], uid: data[:uid]).first_or_create do |user|
            user.email = data[:info][:email]
        end
    end
end