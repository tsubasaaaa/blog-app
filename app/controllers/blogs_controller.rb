class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index ,:show]

  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Blog.create()
  end
  
  def destroy
  end

  def update
  end

  def edit
  end

  def show
  end

  private
    def blog_params
      params.permit()
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
    
end
