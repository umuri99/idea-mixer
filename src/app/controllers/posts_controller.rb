class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(8)
  end

  def new
  end

  def create
  end

  def show
    @post = Post.find(params[:id])
  end

end
