class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :name, presence: true, length: { minimum: 2}
   has_many :post_images
   has_many :books
   attachment :profile_image
end
