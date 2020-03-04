class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update]
  before_action :redirect_if_not_note_author, only: [:edit, :update]

  def index
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
    @patient = Patient.find_by_id(params[:patient_id])
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to patient_path(@note.patient_id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to note_path
    else
      #error
      render :edit
    end
  end

  def destroy
    @note = Note.find_by_id(params[:id]).destroy
    redirect_to notes_path(@note)
  end

  private

  def note_params
    params.require(:note).permit(:content, :patient_id)
  end

  def set_note
    @note = Note.find_by_id(params[:id])
    if !@note
      redirect_to notes_path
    end
  end

  def redirect_if_not_note_author
    redirect_to notes_path if @note.user != current_user
  end
end
