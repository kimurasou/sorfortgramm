class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
        flash[:notice] = "ユーザー情報を編集しました"
        redirect_to user_path(@user)
    else
      render action: edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
  
end
