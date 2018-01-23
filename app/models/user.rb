class User < ApplicationRecord
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         devise :registerable, :confirmable
         has_many :comments, dependent: :destroy
          has_many :movies, through: :comments
          validates_presence_of :name
end
