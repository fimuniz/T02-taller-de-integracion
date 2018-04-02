class CommentsController < ApplicationController

      def index
        comments = Article.find(params[:article_id]).comments;
        # comments = Comment.all.select {|comment| comment.article_id == article.id}
        render json: {status: 'OK', message: 'bla', data:comments }, status: :ok
      end

      def show
        comment = Comment.find(params[:id]);
        render json: {status: 'OK', message: 'bla', data:comment }, status: :ok
      end

      def create
        comment = Comment.new(comment_params)
        if comment.save
        render json: comment, status: :created
        else
        render json: comment.errors, status: :created
        end
      end

      def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: {status: 'OK', message: 'bla', data:comment}, status: :ok
      end

      def update
        comment = Comment.find(params[:id])
        if comment.update(comment_params)
        render json: {status: 'OK', message: 'bla', data:comment}, status: :ok
        else
        render json: {status: 'NOT OK', message: 'bla', data:comment.errors}, status: :ok
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        # def set_comment
        #   @comment = Comment.find(params[:id])
        # end

        # Never trust parameters from the scary internet, only allow the white list through.
        def comment_params
          params.permit(:author, :comment, :article_id)
        end

end
