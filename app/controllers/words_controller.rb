class WordsController < ApplicationController
  before_action :set_language_category
  before_action :set_category_word, only: [:show, :update, :destroy]

  # GET /languages/:id/sections/:id/words
  def index
    json_response(@section.words, ['translations', 'adnotations', 'categories', 'language'])
  end

  # POST /languages/:id/sections/:id/words
  def create
    @word = @section.words.create!(word_params)
    if(params[:tags])
      params[:tags].split(",").map do |tag|
        @word.categories << Category.where(name: tag.strip, language: Language.find(params[:language_id])).first_or_create!
      end
    end
    json_response(@word, ['translations', 'adnotations', 'categories', 'language'], :created)
  end

  # GET /languages/:id/words/:id
  def show
    json_response(@word, ['translations', 'adnotations', 'categories', 'language'])
  end

  # PUT /languages/:id/words/:id
  def update
    @word.update(word_params)
    head :no_content
  end

  # DELETE /languages/:id/words/:id
  def destroy
    @word.destroy
    head :no_content
  end

  private

  def word_params
    # whitelist params
    params.permit(:key)
  end

  def set_language_category
    @language = Language.find(params[:language_id])
    @section = @language.sections.find_by!(id: params[:section_id]) if @language
  end

  def set_category_word
    @word = @section.words.find_by!(id: params[:id]) if @section
  end
end
