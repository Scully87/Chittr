class PostsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
        redirect_to posts_path
    else @post.delete
      flash[:notice] = 'Error! Post has already been created'
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'You cannot edit this - please try again!'
    redirect_to '/posts'
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end


  def destroy
    @post = current_user.posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'You cannot delete this'
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

end