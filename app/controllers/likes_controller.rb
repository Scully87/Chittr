class LikesController < ApplicationController

	def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    render json: {new_like_count: @post.likes.count}
  end

  def index
  	redirect_to posts_path
	end

end
