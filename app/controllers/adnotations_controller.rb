class AdnotationsController < ApplicationController
  before_action :set_language_word
  before_action :set_word_adnotation, only: [:show, :update, :destroy]

  # GET languages/:id/words/:id/adnotations
  def index
    json_response(@word.adnotations, [])
  end

  # POST /languages/:id/words/:id/adnotations
  def create
    @adnotation = @word.adnotations.create!(adnotation_params)
    json_response(@adnotation, [], :created)
  end

  # GET /languages/:id/words/:id/adnotations/:id
  def show
    json_response(@adnotation, [])
  end

  # PUT /languages/:id/words/:id/adnotations/:id
  def update
    @adnotation.update(adnotation_params)
    head :no_content
  end

  # DELETE /languages/:id/word/:id/adnotations/:id
  def destroy
    @adnotation.destroy
    head :no_content
  end

  private

  def adnotation_params
    # whitelist params
    params.permit(:phrase)
  end

  def set_language_word
    @language = Language.find(params[:language_id])
    @word = @language.words.find_by!(id: params[:word_id]) if @language
  end

  def set_word_adnotation
    @adnotation = @word.adnotations.find_by!(id: params[:id]) if @word
  end
end
