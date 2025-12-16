# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
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
      redirect_to post_path(@post), flash: { success: t(:comment_success) }
    else
      redirect_to post_path(@post), flash: { alert: t(:comment_failure) }
    end
  end

  private

  def comment_params
    params.expect(post_comment: %i[content parent_id])
  end
end
