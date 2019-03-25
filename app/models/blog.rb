class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {maximum: 140}

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  paginates_per 10

  scope :index_all, ->{
    select(:id, :title, :content, :created_at, :user_id)
    .order(created_at: :asc)
    .includes(:user)
  }
end
