class Admin::CategoriesController < Admin::ApplicationController
  before_filter :require_admin_login
  #before_filter :find_article, :only => [:destroy, :show, :update, :edit, :show]
  def index
    @categories = Category.where(["parent_id IS NULL"])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
        redirect_to root_url, :notice => "Sign Up !"
        #UserMailer.registration_confirmation(@user).deliver
    else
      render "new"
    end
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end
  
  def update
    #render :text=> params[:id]
    @category = Category.find_by_id(params[:id])
    @category.update_attributes(params[:category])
    #@category.id = params[:id]
    redirect_to edit_admin_category_path
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end
end
