class CommentsController < ApplicationController

  def index
    @comments = Comment.all.order(:id).reverse
    @post = @comment.post
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create( comment_params )
    @comment.update( timestamp: Time.now.strftime("%b %e %Y, %l:%M%P") )
    redirect_to post_comment_path(@post, @comment)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id] )
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id] )
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id] )
    @comment.update( comment_params )
    @comment.update( timestamp: Time.now.strftime("%b %e %Y, %l:%M%P") )
    redirect_to post_comment_path(@post, @comment)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find( params[:id] )
    @comment.destroy
    redirect_to @post
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :title, :body, :timestamp, :post)
  end

end
