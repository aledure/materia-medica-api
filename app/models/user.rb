class User < ApplicationRecord
    validates :email, uniqueness: true
    has_many :recipes
    has_secure_password

    def generate_token!
        update_attribute :token, AccessToken.new(self).generate
    end
    
    def profile
        {
            id: id,
            first_name: first_name,
            last_name: last_name,
            username: username,
            token: token,
            email: email
        }
    
    end
end