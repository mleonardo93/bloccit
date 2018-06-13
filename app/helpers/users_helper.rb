module UsersHelper
  def no_posts?(user)
    user.posts.empty? ? true : false
  end

  def no_comments?(user)
    user.comments.empty? ? true : false
  end
end
