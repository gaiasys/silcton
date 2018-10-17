class Experimenter::StudiesController < ApplicationController
  before_action :authenticate_experimenter!

  def index
    if current_experimenter.administrator
      @studies = Study.where('')
    else
      @studies = current_experimenter.lab.studies
    end
  end

  def new
    @study = Study.new
  end

  def show
    @study = Study.find(params[:id])
  end

  def data
    @study = Study.find(params[:id])

    if params[:table]
      @table = params[:table]
    else
      @table = 'spatial-ability-and-demographics'
    end
  end

  def edit
    @study = Study.find(params[:id])
  end

  def create
    @study = Study.new(study_params)
    respond_to do |format|
      if @study.save
        flash[:success] = "Study record created for <strong>#{@study.name}</strong>."
        format.html { redirect_to(experimenter_study_url(@study)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @study = Study.find(params[:id])

    respond_to do |format|
      if @study.update_attributes(study_params)
        flash[:success] = "Study record updated for <strong>#{@study.name}</strong>."
        format.html { redirect_to(experimenter_study_url(@study)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @study = Study.find(params[:id])
    @study.destroy

    respond_to do |format|
      flash[:success] = "Study record deleted for <strong>#{@study.name}</strong>."
      format.html { redirect_to(experimenter_studies_url) }
    end
  end
  private
  def study_params
    params.require(:study).permit(:name, :lab_id, :experimenter_id, :active, :ask_participant_id, :when_to_share_data, :kind_of_start_buttons, :welcome_text, :completion_text, instrument_in_studies_attributes: [:order, :instrument, :version, :randomize, :force_wait, :id, :_destroy])
  end
end
