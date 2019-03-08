class CommentsController < ApplicationController
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to blog_path(@comment.blog_id)
  end

  def create
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      redirect_to blog_path(@comment.blog_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@comment.blog_id)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :blog_id)
    end
end
