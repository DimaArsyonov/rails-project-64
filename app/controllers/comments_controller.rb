# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, flash: { success: t(:comment_success) }
    else
      redirect_to @post, flash: { error: @comment.errors.first.full_message }
    end
  end

  private

  def comment_params
    params.expect(post_comment: %i[content parent_id])
  end
end
