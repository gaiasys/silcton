class Experimenter::ParticipantsController < ApplicationController
  before_action :authenticate_experimenter!

  def index
    @study = Study.find(params[:study_id])
    @participants = @study.participants
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    @participant.update_attributes(participant_params)
    render json: { success: true }
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      flash[:success] = "Participant records deleted for <strong>#{@participant.identification}</strong>."
      format.html { redirect_to(experimenter_study_url(@participant.study)) }
    end
  end

  def participant_params
    params.require(:participant).permit(:id, :pilot_subject)
  end
end
