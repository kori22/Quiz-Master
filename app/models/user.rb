class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many	:answers
  validates_presence_of [:username, :email, :password]

  default_scope { order(created_at: :desc) }
end
