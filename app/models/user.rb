class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :profile_image

  has_many :books
  validates_presence_of :name
  validates :name, length: {minimum:2}       # 「1文字以上」
  validates :name,length: {maximum:20}      # 「20文字以下」
  validates :introduction, length: {maximum:50}


end
