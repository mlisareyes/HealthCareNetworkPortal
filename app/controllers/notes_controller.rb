class NotesController < ApplicationController

  def index
    # raise.inspect
    if params[:patient_id] && @patient = Patient.find_by_id(params[:patient_id])
      @notes = @patient.notes
    else
      @notes = Notes.all
    end
  end

  def new
    @note = Note.new
  end

  def create
    @note = Patient.find_by_id(params[:patient_id]).notes.build(notes_params)
    @note.user_id = current_user.id
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
    params.require(:note).permit(:content)
  end
end
