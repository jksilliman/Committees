class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable, :omniauthable, :registerable, :validatable

  devise :ldap_authenticatable, 
         :recoverable, :rememberable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :remember_me


  before_save :get_ldap_email
  def get_ldap_email 
    self.email = Devise::LdapAdapter.get_ldap_param(self.username,"mail")[0] 
  end
end
