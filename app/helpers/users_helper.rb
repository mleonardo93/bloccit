module UsersHelper
  def inactive?(user)
    user.posts.empty? && user.comments.empty? ? true : false
  end
end
