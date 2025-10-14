# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    @comment.parent_id = params[:parent_id]
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post, anchor: "comment-#{@comment.id}"), notice: t('.success')
    else
      redirect_to post_path(@post), alert: t('.failure')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
