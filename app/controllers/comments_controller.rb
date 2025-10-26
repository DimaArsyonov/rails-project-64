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
      redirect_to post_path(@post), notice: t('.success')
    else
      redirect_to post_path(@post), alert: t('.failure')
    end
  end

  def reply
    @post = Post.find(params[:post_id])
    parent_comment = @post.comments.find(params[:id])
    @comment = @post.comments.build(parent_id: parent_comment.id)
    render :reply
  end

  private

  def comment_params
    params.expect(post_comment: %i[content parent_id])
  end
end
