class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :forum_threads
  has_many :forum_posts
  has_one_attached :avatar
  enum level: {member: 0, admin: 1}
end
