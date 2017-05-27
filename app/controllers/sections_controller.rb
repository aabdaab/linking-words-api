class SectionsController < ApplicationController
  before_action :set_language
  before_action :set_language_section, only: [:show, :update, :destroy]

  # GET languages/:id/sections
  def index
    json_response(@language.sections, ['words'])
  end

  # POST /languages/:id/sections
  def create
    @section = @language.sections.create!(section_params)
    json_response(@section, ['words'], :created)
  end

  # GET /languages/:id/sections/:id
  def show
    json_response(@section, ['words'])
  end

  # PUT /languages/:id/sections/:id
  def update
    @section.update(section_params)
    head :no_content
  end

  # DELETE /languages/:id/sections/:id
  def destroy
    @section.destroy
    head :no_content
  end

  private

  def section_params
    # whitelist params
    params.permit(:name)
  end

  def set_language
    @language = Language.find(params[:language_id])
  end

  def set_language_section
    @section = @language.sections.find_by!(id: params[:id]) if @language
  end
end
