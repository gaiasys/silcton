class Experimenter::ExperimentersController < ApplicationController
  before_action :authenticate_experimenter!
  
  def index
    if current_experimenter.administrator
      @experimenters = Experimenter.where('')
    else
      @experimenters = current_experimenter.lab.experimenters
    end
  end
  
  def new
    @experimenter = Experimenter.new
  end
  
  def show
    @experimenter = Experimenter.find(params[:id])
  end
  
  def edit
    @experimenter = Experimenter.find(params[:id])
  end
  
  def create
    @experimenter = Experimenter.new(experimenter_params)

    respond_to do |format|
      if @experimenter.save
        flash[:success] = "Experimenter record created for <strong>#{@experimenter.full_name}</strong>."
        format.html { redirect_to(experimenter_experimenter_url(@experimenter)) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @experimenter = Experimenter.find(params[:id])

    respond_to do |format|
      if @experimenter.update_attributes(experimenter_params)
        flash[:success] = "Experimenter record updated for <strong>#{@experimenter.full_name}</strong>."
        format.html { redirect_to(experimenter_experimenter_url(@experimenter)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @experimenter = Experimenter.find(params[:id])
    @experimenter.destroy

    respond_to do |format|
      flash[:success] = "Experimenter record deleted for <strong>#{@experimenter.full_name}</strong>."
      format.html { redirect_to(experimenter_experimenters_url) }
    end
  end
  private

  def experimenter_params
    params.require(:experimenter).permit(:id, :lab_id, :first_name, :last_name, :lab_manager, :administrator, :email, :password, :password_confirmation)
  end
end
