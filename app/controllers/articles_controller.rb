class ArticlesController < ApplicationController
  def home
    @articles = Article.all
  end

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.create(article_params)
    redirect_to articles_path
  end

  def show
    @articles = Article.find(params[:id])
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    @articles = Article.find(params[:id])
    @articles.update(article_params)
    redirect_to home_path
  end

  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy
    redirect_to home_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
