# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like ||= @post.post_likes.build(user: current_user)

    if @like.persisted?
      redirect_to post_path(@post), notice: t('.already_liked')
    elsif @like.save
      redirect_to post_path(@post), notice: t('.liked')
    else
      redirect_to post_path(@post), alert: t('.failed')
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.post_likes.find_by(user: current_user)

    if @like&.destroy
      redirect_to post_path(@post), notice: t('.unliked')
    else
      redirect_to post_path(@post), alert: t('.failed')
    end
  end
end
