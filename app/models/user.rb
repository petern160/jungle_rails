class User < ActiveRecord::Base

    has_secure_password
    has_many :reviews
    validates :email, uniqueness: true, presence: true 
    validates :password, length: { minimum: 5}, presence: true
    validates :password_confirmation, length: { minimum: 5}, presence: true
    validates :name, presence: true
    validates :last_name, presence: true
  

 

    def self.authenticate_with_credentials(email, password)
      email = email.downcase.strip
        
      else
        nil
      end
    end


    def passwordSame?
      self.password == self.password_confirmation
    end
  end

 