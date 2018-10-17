class CommentsController < ApplicationController
  before_action :authenticate_user!, :find_movie
  before_action :find_comment, only: :destroy

  def index
  	@comment = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.movie = @movie
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment added"
    else
      flash[:alert] = "You can only add 1 comment per movie"
    end
    redirect_to @movie
  end

  def destroy
    if @comment.destroy
      flash[:succes] = "Comment removed"
    else
      flash[:alert] = @comment.errors.full_messages.join(", ")
    end
    redirect_to @movie
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
