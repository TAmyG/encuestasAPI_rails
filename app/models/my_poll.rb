class MyPoll < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: {minimum:10}
    validates :expires_at, presence: true
    validates :description, presence: true, length: {minimum: 20}
    
    #retorna true si la fecha actual es menor a la de expiración
    def is_valid?
        DateTime.now < self.expires_at
    end
end
