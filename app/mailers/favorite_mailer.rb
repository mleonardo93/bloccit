class FavoriteMailer < ApplicationMailer
  default from: "mleonardo@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@serene-woodland-26561.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@serene-woodland-26561.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@serene-woodland-26561.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(topic, post)
    headers["Message-ID"] = "<posts/#{post.id}@serene-woodland-26561.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@serene-woodland-26561.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@serene-woodland-26561.herokuapp.com>"

    @topic = topic
    @post = post

    mail(to: post.user.email, subject: "Following new post in #{topic.name}")
  end
end
