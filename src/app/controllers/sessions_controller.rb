class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      #ユーザーログイン後にホームにリダイレクトする
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or root_path
      else
        message  = "アカウントが有効化されていません "
        message += "メールにアカウント有効化用リンクが記載されてますので、ご確認ください"
        flash[:danger] = message
        redirect_to root_url
      end
    else
      #エラーメッセージを作成する
      flash.now[:danger] = "メールアドレスまたはパスワードが違います"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
