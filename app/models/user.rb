class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  ROLE_ADMIN = 'admin'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :articles


  def short_email
    self.email.split("@").first
  end

  def admin?
    self.role == ROLE_ADMIN
  end

  def display_name
    first_name || email
  end

end
