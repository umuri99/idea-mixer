class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :show, :favorite]
  before_action :correct_user, only:[:edit, :update, :favorite]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(8)
  end

  def favorite
    @user = User.find(params[:id])
    @posts = @user.favorite_posts.page(params[:page]).per(8)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:success] = "送信されたメールを確認してアカウントを有効にしてください"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      #更新に成功した場合を扱う
      flash[:success] = "登録情報を更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #ここからbeforeアクション▼

    #正しいユーザーかどうかの確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
