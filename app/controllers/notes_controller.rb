class NotesController < NestedResourcesController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:notes_data_type, :notes_data_id, :notes_text, :employee_id, :status)
    end
end
