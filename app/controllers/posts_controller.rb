# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    @posts = Post.includes(:category, :creator).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @comments = @post.comments.includes(:user).arrange(order: { created_at: :desc })
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = current_user.posts.new(post_params)
    @categories = Category.all
    if @post.save
      redirect_to @post, flash: { success: t(:post_success) }
    else
      flash.now[:alert] = t(:post_failure)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.expect(post: %i[title body category_id])
  end
end
