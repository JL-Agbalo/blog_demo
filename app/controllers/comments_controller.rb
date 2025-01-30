class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was successfully created."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Comment was not created."
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      flash[:notice] = "Comment was successfully deleted."
      redirect_to post_path(@post)
    else
      flash[:alert] = "You can't delete this comment."
      redirect_to post_path(@post)
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    repost_to do |format|
      if @comment.update(comment_params)

        format.html { redirect_to post_url(@post), notice: "Comment was successfully updated." }
      else
        format.html { redirect_to post_url(@post), alert: "Comment was not updated!" }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
