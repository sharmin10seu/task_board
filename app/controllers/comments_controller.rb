class CommentsController < ApplicationController
  def create
    comment = Comment.new(params[:comment])
    comment.save
    redirect_to :back, notice: "Your comment has been posted successfully!"
  end
end
