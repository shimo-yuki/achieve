class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, presence: true
  has_one_attached :icon
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  paginates_per 10


  scope :index_all, ->{
    select(:id, :name)
    .order(created_at: :asc)
    .includes(:blogs)
  }

end
