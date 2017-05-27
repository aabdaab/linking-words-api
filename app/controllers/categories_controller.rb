class CategoriesController < ApplicationController
  before_action :set_language
  before_action :set_language_category, only: [:show, :update, :destroy]
  before_action :set_word, only: [:create]

  # GET languages/:id/categories
  def index
    json_response(@language.categories, ['words'])
  end

  # POST /languages/:id/sections/:id/words/:id/categories
  def create
    @category = @word.categories.create!(category_params)
    json_response(@category, ['words'], :created)
  end

  # GET /languages/:id/categories/:id
  def show
    json_response(@category, ['words'])
  end

  # PUT /languages/:id/categories/:id
  def update
    @category.update(category_params)
    head :no_content
  end

  # DELETE /languages/:id/categories/:id
  def destroy
    @category.destroy
    head :no_content
  end

  private

  def category_params
    # whitelist params
    params.permit(:name)
  end

  def set_language
    @language = Language.find(params[:language_id])
  end

  def set_language_category
    @category = @language.categories.find_by!(id: params[:id]) if @language
  end

  def set_word
    @section = @language.sections.find_by!(id: params[:section_id]) if @language
    @word = @section.words.find_by!(id: params[:word_id]) if @section
  end
end
