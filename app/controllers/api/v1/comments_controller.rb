class Api::V1::CommentsController < ApplicationController

  def index
    comments = Comment.all
    render json: comments
  end

  def new
    comments = Comment.new
  end

  def create
     # byebug
    comment = Comment.create(comments_params)
  end


  private

  def comments_params
    params.require(:comment).permit(:content)
  end

end
