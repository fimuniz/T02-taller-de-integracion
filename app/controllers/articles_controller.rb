class ArticlesController < ApplicationController
  include ActionView::Helpers::TextHelper
    def index
      articles = Article.order('created_at DESC')
      articles.each do |article|
          article.body.truncate(1)
      end
      render json: articles.as_json(except: [:updated_at]), status: :ok
    end

    def show
      article = Article.find(params[:id])
      render json: article.as_json(except: [:updated_at]), status: :ok
    end

    def create
      article = Article.new(article_params)
      if article.save
        render json: article, status: :created
      else
        render json: article.errors, status: :created
      end
    end

    def destroy
      article = Article.find(params[:id])
      article.destroy
      render json: article, status: :created
    end

    def update
      article = Article.find(params[:id])
      if article.update(article_params)
        render json: article, status: :created
      else
        render json: article.errors, status: :created
      end
    end

    private
    def article_params
      params.permit(:title, :subtitle, :body)
    end

end
