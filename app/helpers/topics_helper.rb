module TopicsHelper
  def user_is_authorized_for_moderator?
    current_user && (current_user.admin? || current_user.moderator?)
  end

  def user_is_authorized_for_admin?
    current_user && current_user.admin?
  end
end
