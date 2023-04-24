class TranslationsController < ApplicationController
  before_action :set_translation, only: %i[ show ]

  # GET /translations/1
  def show
    render json: @translation
  end

  # POST /translations
  def create
    @translation = Translation.new(translation_params)
    @translation.translate

    if @translation.errors.present?
      render json: @translation.errors.full_messages, status: :unprocessable_entity
    elsif @translation.save
      render json: @translation, status: :created, location: @translation
    else
      render json: @translation.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def translation_params
      params.require(:translation).permit(:source_language_code, :target_language_code, :source_text, :translated_text, :glossary_id)
    end
end
