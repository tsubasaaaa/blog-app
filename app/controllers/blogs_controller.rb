class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index ,:show]

  def index
   @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog: blog_params[:blog], user_id: current_user.id)
    
  end
  
  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
    def blog_params
      params.require(:blog).permit(:blog, :id)
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end
