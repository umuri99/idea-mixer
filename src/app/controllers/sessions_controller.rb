class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      #ユーザーログイン後にホームにリダイレクトする
      log_in user
      redirect_to root_path
    else
      #エラーメッセージを作成する
      flash.now[:danger] = "メールアドレスまたはパスワードが違います"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
