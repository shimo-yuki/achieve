class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :icon
  validates  :email,  presence: true
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  scope :index_all, ->{
    select(:id, :name)
    .order(created_at: :asc)
    .includes(:blogs)
  }

end
