class ProductsController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy, :show]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.user_id = current_user.id
    if @product.save
        redirect_to root_url, :notice => "Sign Up !"
        #UserMailer.registration_confirmation(@user).deliver
    else
      render "new"
    end
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end
  
  def update
    #render :text=> params[:id]
    @product = Product.find_by_id(params[:id])
    @product.update_attributes(params[:product])
    #@product.id = params[:id]
    redirect_to edit_product_path
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    @product.destroy
    redirect_to products_path
  end
end
