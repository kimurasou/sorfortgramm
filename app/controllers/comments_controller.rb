class CommentsController < ApplicationController

  before_action :authenticate_user!


  def create
    # @comment = Comment.new(comment_params)
    # @post = Post.find_by(id: params[:id])
    # binding.pry
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_to "/posts/#{@comment.post.id}"
    else
      flash[:alert] = "コメントできませんでした"
    end
  end

  # def show
  #   @comment = Comment.new
  #   @comments = @posts.comments.includes(:user)
  # end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post
    if @comment.destroy
      flash[:notice] = "コメントを削除しました"
    else
      flash[:alert] = "コメントの削除に失敗しました"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])  
  end
end
