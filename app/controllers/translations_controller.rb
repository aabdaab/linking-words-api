class TranslationsController < ApplicationController
  before_action :set_language_word
  before_action :set_word_translation, only: [:show, :update, :destroy]

  # GET languages/:id/words/:id/translations
  def index
    json_response(@word.translations, [])
  end

  # POST /languages/:id/words/:id/translations
  def create
    @translation = @word.translations.create!(translation_params)
    json_response(@translation, [], :created)
  end

  # GET /languages/:id/words/:id/translations/:id
  def show
    json_response(@translation, [])
  end

  # PUT /languages/:id/words/:id/translations/:id
  def update
    @translation.update(translation_params)
    head :no_content
  end

  # DELETE /languages/:id/word/:id/translations/:id
  def destroy
    @translation.destroy
    head :no_content
  end

  private

  def translation_params
    # whitelist params
    params.permit(:name)
  end

  def set_language_word
    @language = Language.find(params[:language_id])
    @word = @language.words.find_by!(id: params[:word_id]) if @language
  end

  def set_word_translation
    @translation = @word.translations.find_by!(id: params[:id]) if @word
  end
end
