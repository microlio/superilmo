require 'digest/sha1'

class User < ActiveRecord::Base
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :username
  #validates_uniqueness_of :username

  def password 
    @password
  end
  
  def password=(pwd) 
    @password = pwd 
    return if pwd.blank? 
    create_new_salt 
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  attr_accessor :password_confirmation 
  validates_confirmation_of :password
  validates_length_of :password, :in => 5..200, :allow_blank => true
  validate :password_non_blank 
  
  def self.authenticate(name, password) 
    user = self.find_by_username(name) 
    if user
      expected_password = encrypted_password(password, user.salt) 
      if user.hashed_password != expected_password
        user = nil 
      end
    end
    user
  end
  # 'password' is a virtual attribute
  
  private
  
  def password_non_blank 
    errors.add(:password, "Missing password") if hashed_password.blank?
  end
  
  def create_new_salt 
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def self.encrypted_password(password, salt) 
    string_to_hash = password + "wibble" + salt 
    Digest::SHA1.hexdigest(string_to_hash)
  end 
  
end
