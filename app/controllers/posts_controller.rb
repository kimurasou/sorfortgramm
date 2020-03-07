class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
    @post = Post.find_by(params[:id])
    # @comment = Comment.new
    # @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "削除されました"
    else
      flash[:alert] = "削除できませんでした"
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text, photos_attributes: [:image]).merge(user_id: current_user.id)
  end
end
