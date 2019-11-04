class CommentsController < ApplicationController
    def show
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end

    def create
        @post = Post.find(params[:post_id])
        if params[:comment_id] == nil
            @post.comments.create(
                params[:comment].permit(:name, :content)
            )
        else
            @comment = Comment.find(params[:comment_id])
            @comment.comments.create(
                name: params[:name], 
                content: params[:content]
            )
        end
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
end