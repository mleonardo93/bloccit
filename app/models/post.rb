class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
<<<<<<< HEAD
  after_create :create_vote
=======
  after_create :add_favorite, :create_vote
>>>>>>> checkpoint-30-assignment

  default_scope { order("rank DESC") }
  scope :ordered_by_title, -> { Post.order("posts.title") }
  scope :ordered_by_reverse_created_at, -> { Post.order("posts.created_at").reverse }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end

  private

  def add_favorite
    Favorite.create(post: self, user: self.user)
    FavoriteMailer.new_post(topic, self).deliver_now
  end

  def create_vote
    user.votes.create(value: 1, post: self)
  end
end
