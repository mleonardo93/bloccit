class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each.with_index do |post, i|
      if i % 5 == 0 || post == @posts.first
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
