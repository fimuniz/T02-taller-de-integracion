class ArticlesController < ApplicationController

      def index
        articles = Article.order('created_at DESC');
        render json: {status: 'OK', message: 'bla', data:articles}, status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: {status: 'OK', message: 'bla', data:article}, status: :ok
      end

      def create
        article = Article.new(article_params)
        if article.save
        render json: {status: 'OK', message: 'bla', data:article}, status: :ok
        else
        render json: {status: 'NOT OK', message: 'bla', data:article.errors}, status: :ok
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {status: 'OK', message: 'bla', data:article}, status: :ok
      end

      def update
        article = Article.find(params[:id])
        if article.update(article_params)
        render json: {status: 'OK', message: 'bla', data:article}, status: :ok
        else
        render json: {status: 'NOT OK', message: 'bla', data:article.errors}, status: :ok
        end
      end

      private
      def article_params
        params.permit(:title, :subtitle, :body)
      end

end
