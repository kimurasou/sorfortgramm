class HomesController < ApplicationController
  def home
    @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
    @comment = Comment.new
    @comments = @posts.comments.includes(:user)
  end
end
