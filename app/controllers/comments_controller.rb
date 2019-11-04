class CommentsController < ApplicationController
    def show
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end

    def create
        @post = Post.find(params[:post_id])
        if params[:comment_id] == nil
            # @comment = Comment.find(params[:id])
            @post.comments.create(
                params[:comment].permit(:name, :comment)
            )
        else
            # @post = Post.find(params[:post_id])
            # @comment =  @post.comments.create(params[:comment].permit(:name, :comment))
            # redirect_to post_path(@post)
            @comment = Comment.find(params[:comment_id])
            @new_comment = Comment.new(
                name: params[:name], 
                comment: params[:comment],
                parent: @comment,
                commentable: @comment
            )
            @new_comment.save
            # @comment.replies.create(
            #     name: params[:name], 
            #     comment: params[:comment]
            # )
        end
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
end