class User < ActiveRecord::Base
  attr_accessible :email, :password_digest
  has_secure_password
  validates :email, :password, :presence => true
  validates :email, :uniqueness => true
  attr_accessible :email, :password, :password_confirmation
  has_one :list
end
