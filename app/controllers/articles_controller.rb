class ArticlesController < ApplicationController
  # 
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all
  end
  
  # new is handled by create action (cannot work without create action)
  def new
    @article = Article.new
  end
  
  # handled by update action
  def edit
    
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    # the params[:id] pulls from the parameters of the url. Shows the specific article you JUST created
    
  end
  
  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully destroyed"
    redirect_to articles_path
  end
  
  private
  
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end