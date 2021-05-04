class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.article = params[:article_id]
        if @comment.save
            redirect_to posts_path, notice: 'Comment was successfully created.'
            redirect_to article_url(params[:article_id])
        else
            redirect_to article_url(params[:article_id])
        end
        
    end


    private
    def comment_params
        params.require(:comment).permit(:content :author_id)
    end
end
