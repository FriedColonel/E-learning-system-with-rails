class ExamplesController < ApplicationController
  def create
    @word = Word.find_by id: params[:example][:word_id]
    @example = @word.examples.build example_params
    @word.examples << @example
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def update
    @word = Word.find_by id: params[:example][:word_id]
    @example = Example.find_by id: params[:id]
    @example.update example_params
    # redirect_to controller: :words, action: :show, id: @example.word_id
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @example = Example.find_by id: params[:id]
    @example.destroy
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private
  def example_params
    params.require(:example).permit :meaning, :sentence, :word_id, :hiragana
  end
end
