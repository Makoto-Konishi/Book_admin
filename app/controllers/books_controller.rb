class BooksController < ApplicationController
  protect_from_forgery except: [:destroy]
  before_action :set_book, only: [:show, :destroy]
  around_action :action_logger, only: [:destroy]

  def show
    respond_to do |format|
      format.html # ブロックを省略すると、「render :show, format: :html」と同義
      format.json { render json: @book } # テンプレートの探索はせずに、@bookオブジェクトをJSONにしたデータを返すように指定
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def action_logger
    logger.info 'around-before'
    yield
    logger.info 'around-after'
  end
end
