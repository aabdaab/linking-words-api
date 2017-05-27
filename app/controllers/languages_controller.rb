class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :update, :destroy]

  # GET /languages
  def index
    @languages = Language.all
    json_response(@languages, ['sections', 'categories', 'words'])
  end

  # POST /languages
  def create
    @language = Language.create!(language_params)
    json_response(@language, ['sections', 'categories', 'words'], :created)
  end

  # GET /languages/:id
  def show
    json_response(@language, ['sections', 'categories', 'words'])
  end

  # PUT /languages/:id
  def update
    @language.update(language_params)
    head :no_content
  end

  # DELETE /languages/:id
  def destroy
    @language.destroy
    head :no_content
  end

  private

  def language_params
    # whitelist params
    params.permit(:name)
  end

  def set_language
    @language = Language.find(params[:id])
  end
end
