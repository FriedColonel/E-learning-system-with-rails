class WordsController < ApplicationController
  def create
    @word = Word.new word_params
    @word.save
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def show
    @word = Word.find_by id: params[:id]
    @words = Word.where lesson_id: @word.lesson_id
    @index = @words.find_index @word
    @examples = @word.examples
  end

  def edit
    @word = Word.find_by id: params[:id]
  end

  def update
    @word = Word.find_by id: params[:id]
    if @word.update word_params
      flash[:success] = "Update word successfully"
      redirect_to @word
    else
      flash[:danger] = "Update word error!"
      render :edit
    end 
  end

  def destroy
    @word = Word.find_by id: params[:id]
    @word.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private
  def word_params
    params.require(:word).permit :origin, :meaning, :hiragana, :lesson_id
  end
end
