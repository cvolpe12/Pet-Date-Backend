class Api::V1::CommentsController < ApplicationController
  before_action :find_comment, only: [:update]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      render json: @comment, status: :accepted
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def comment_params
    params.permit(:content, :post_id, :pet_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
