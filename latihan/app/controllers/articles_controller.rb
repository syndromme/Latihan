class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy, :show]
  before_filter :find_article, :only => [:destroy, :show, :update, :edit]
  #before_filter :find_user, :only => [:update, :destroy, :edit, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
    if @article.save
        redirect_to root_url, :notice => "Sign Up !"
    else
      render "new"
    end
  end

  def show
    #@article = Article.find_by_id(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  def index
    @articles = Article.all
  end

  def edit
    #@article = Article.find_by_id(params[:id])
  end
  
  def update
    #render :text=> params[:id]
   # @article = Article.find_by_id(params[:id])
    @article.update_attributes(params[:article])
    #@article.id = params[:id]
    redirect_to edit_article_path
  end

  def destroy
    #@article = Article.find_by_id(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def find_article
      @article=Article.find_by_id(params[:id])
      if @article.nil?
        flash[:error] = "Can't find article with id = '#{params{:id}}'"
        redirect_to root_url
      end
    end

    def find_user
      @user=@article.user_id
      unless @user == current_user.id#session[:user_id]
        redirect_to root_url
      end
    end
end
