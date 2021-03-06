class Admin::UsersController < ApplicationController
#ユーザー一覧
  def index
    @users = User.all
  end
  #ユーザー詳細
  def show
    @user = User.find(params[:id])
    @games = @user.games.all
  end
  #ユーザー情報編集
  def edit
    @user = User.find(params[:id])
    if @user == current_user_user
      render "edit"
    else
      redirect_to user_user_path(current_user_user)
    end
  end
  #ユーザー情報更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_user_path(@user.id)
      flash[:notice] = '編集に成功しました.'
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end

