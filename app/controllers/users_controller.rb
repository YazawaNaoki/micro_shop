class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  def alert
  end

  def delete
    @user = User.find(params[:user_id])
    @user.update_attributes(is_deleted: true)
    redirect_to products_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :last_name, :given_name, :last_name_furigana, :given_name_furigana, :phone_number)
  end
end
