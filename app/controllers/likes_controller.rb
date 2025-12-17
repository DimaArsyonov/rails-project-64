# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like ||= @post.likes.build(user: current_user)
    redirect_to @post if @like&.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user: current_user)
    redirect_to @post if @like&.destroy
  end
end
