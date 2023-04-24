class TermsController < ApplicationController
  before_action :set_glossary, only: %i[ create ]

  # POST /glossaries/1/terms
  def create
    @term = @glossary.terms.new(term_params)

    if @term.save
      render json: @term, status: :created
    else
      render json: @term.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def set_glossary
      @glossary = Glossary.find(params[:glossary_id])
    end

    # Only allow a list of trusted parameters through.
    def term_params
      params.require(:term).permit(:source_term, :target_term)
    end
end
