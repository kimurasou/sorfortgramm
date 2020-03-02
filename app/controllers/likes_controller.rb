class LikesController < ApplicationController

  before_action :authenticate_user!


  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    if @like.destroy
      redirect_to root_path
    end
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
