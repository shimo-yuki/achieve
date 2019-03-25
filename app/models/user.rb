class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, presence: true

  has_one_attached :icon
  has_many :blogs, class_name: "Blog", foreign_key: :user_id, dependent: :destroy
  has_many :comments, class_name: "Comment", foreign_key: :user_id,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', dependent: :destroy, foreign_key: :follower_id
  has_many :passive_relationships, class_name: 'Relationship', dependent: :destroy, foreign_key: :follower_id
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  paginates_per 10

  scope :index_all, ->{
    select(:id, :name)
    .order(created_at: :asc)
    .includes(:blogs)
  }

  def followed?(user)
    active_relationships.find_by(followed_id: user.id).present?
  end

end
