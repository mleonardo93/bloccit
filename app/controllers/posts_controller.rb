class PostsController < ApplicationController
  def index
    @posts = Post.all
    for post in @posts do
      if (((post.id - 1)% 5) == 0) || post.id == 1
        post.title = "SPAM"
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
