class User < ActiveRecord::Base
  rolify
  authenticates_with_sorcery!
  # attr_accessible :title, :body

  attr_accessible :username, :email, :password, :password_confirmation
  attr_accessible :salt, :created_at, :updated_at, :remember_me_token, :remember_me_token_expires_at, :reset_password_token, :reset_password_token_expires_at, :reset_password_email_sent_at

  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :email
end
