class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    if @comment.save
      redirect_to @book
    else
      render 'books/show', status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book.comments.find(params[:id]).destroy
    redirect_to @book
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end