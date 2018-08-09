module NotesHelper
  def class_for_note_list(current_note, note)
    unless current_note.new_record?
      return "is-active" if current_note.id == note.id
    end

    ""
  end
end
