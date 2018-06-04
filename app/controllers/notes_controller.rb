class NotesController < ApplicationController
  before_action :load_notes, only: [:new, :show]
  before_action :load_note, only: [:show, :update, :destroy]

  def index
    if current_user.notes.empty?
      redirect_to new_note_path
    else
      redirect_to note_path(current_user.notes.first)
    end
  end

  def new
    @note = Note.new
  end

  def show
  end

  def create
    @note = current_user.notes.create(note_params)
    redirect_to note_path(@note)
  end

  def update
    @note.update_attributes(note_params)
    redirect_to note_path(@note)
  end

  def destroy
    @note.delete
    redirect_to notes_path
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end

    def load_note
      @note = Note.find(params[:id])
    end

    def load_notes
      @notes = current_user.notes
    end
end
