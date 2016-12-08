class NotesController < ApplicationController
  before_action :require_login

  def create
    @note = Note.new(note_params)
    track = Track.find(params[:track_id])
    @note.track_id = track.id
    @note.user_id = current_user.id
    unless @note.save
      flash[:messages] = @note.errors.full_messages
    end

    redirect_to track_url(track)
  end

  def destroy
    @note = Note.find(params[:id])
    track = @note.track
    if current_user == @note.user
      @note.destroy
      redirect_to track_url(track)
    else
      render text: "You don't have permission to edit this note", status: :forbidden
    end
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end

end
