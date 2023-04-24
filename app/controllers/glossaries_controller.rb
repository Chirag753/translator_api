class GlossariesController < ApplicationController
  before_action :set_glossary, only: %i[ show update destroy ]

  # GET /glossaries
  def index
    # @glossaries = Glossary.all

    # render json: @glossaries
    @glossaries = Glossary.includes(:terms).all

    render json: @glossaries.to_json(include: :terms)
  end

  # GET /glossaries/1
  def show
    render json: @glossary.to_json(include: :terms)
  end

  # POST /glossaries
  def create
    @glossary = Glossary.new(glossary_params)

    if @glossary.save
      render json: @glossary, status: :created, location: @glossary
    else
      render json: @glossary.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glossary
      @glossary = Glossary.includes(:terms).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def glossary_params
      params.require(:glossary).permit(:id, :source_language_code, :target_language_code)
    end
end
