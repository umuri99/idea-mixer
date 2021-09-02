class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy


  def index
    @posts = Post.page(params[:page]).per(8)
  end

  def new
    @theme1 = params.require(:theme)[:theme1]
    if @theme1.blank?
      flash[:danger] = "テーマ１を入力してください"
      redirect_to root_url
    end
    @theme2 = Material.where('id>=?', rand(Material.first.id..Material.last.id)).first.theme
    @post = current_user.posts.build if logged_in?
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿完了"
      redirect_to root_url
    else
      @theme1 = params.require(:post)[:theme1]
      @theme2 = params.require(:post)[:theme2]
      render 'posts/new'
    end
  end

  def destroy
    @posts.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to root_url
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :theme1, :theme2, :content)
    end

    def correct_user
      @posts = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @posts.nil?
    end

end
