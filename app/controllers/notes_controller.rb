class NotesController < ApplicationController
  # before_action :set_note, only: [:show, :edit, :update]

  def index
    # raise.inspect
    if params[:patient_id] && @patient = Patient.find_by_id(params[:patient_id])
      @notes = @patient.notes
    else
      @notes = Note.all
    end
  end

  def new
    if params[:patient_id] && @patient = Patient.find_by_id(params[:patient_id])
      @note = @patient.notes.build
    else
      @note = Note.new
    end
  end

  def create
    @note = current_user.notes.build(notes_params)
    if @note.save
      redirect_to notes_path
    else
      # raise.inspect
      render :new
    end
    # @note = Patient.find_by_id(params[:patient_id]).notes.build(notes_params)
    # @note.user_id = current_user.id
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def notes_params
    params.require(:note).permit(:content, :patient_id)
  end

  # def set_note
  #   @note = Note.find_by_id(params[:id])
  #   if !@note
  #     redirect_to notes_path
  #   end
  # end
end
