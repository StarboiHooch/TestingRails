class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "password", except: [ :index, :show ]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    if !@article.public?
      render_error("This article is no longer available.")
    end

  rescue ActiveRecord::RecordNotFound
    render_error("No article exists with that ID.")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.update(status: "archived")

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
