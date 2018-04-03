class CommentsController < ApplicationController

      def index
        comments = Article.find(params[:article_id]).comments;
        # comments = Comment.all.select {|comment| comment.article_id == article.id}
        render json: comments, status: :created
      end

      def show
        comment = Comment.find(params[:id]);
        render json: comment, status: :created
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
        render json: comment, status: :created
      end

      def update
        comment = Comment.find(params[:id])
        if comment.update(comment_params)
        render json: comment, status: :created
        else
        render json: comment.errors, status: :created
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
