class CommentsController < ApplicationController
    def show
        # @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end

    def create
        if params[:comment_id] == nil
            @post = Post.find(params[:post_id])
            @post.comments.create(
                params[:comment].permit(:name, :content),
            )
            redirect_to post_path(@post)
        else
            @comment = Comment.find(params[:comment_id])
            @comment.comments.create(
                name: params[:name], 
                content: params[:content],
                post: @comment.post
            )
            redirect_to post_path(@comment.post)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @post = @comment.post
        @comment.destroy
        redirect_to post_path(@post)
    end
end