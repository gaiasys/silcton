class Experimenter::LabsController < ApplicationController
  before_action :authenticate_experimenter!

  def index
    @labs = Lab.all.includes(:experimenters, :studies)
  end

  def new
    @lab = Lab.new
  end

  def show
    @lab = Lab.find(params[:id])
  end

  def edit
    @lab = Lab.find(params[:id])
  end

  def create
    @lab = Lab.new(lab_params)

    respond_to do |format|
      if @lab.save
        flash[:success] = "Lab record created for <strong>#{@lab.name}</strong>."
        format.html { redirect_to(experimenter_lab_url(@lab)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @lab = Lab.find(params[:id])

    respond_to do |format|
      if @lab.update_attributes(lab_params)
        flash[:success] = "Lab record updated for <strong>#{@lab.name}</strong>."
        format.html { redirect_to(experimenter_lab_url(@lab)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @lab = Lab.find(params[:id])
    @lab.destroy

    respond_to do |format|
      flash[:success] = "Lab record deleted for <strong>#{@lab.name}</strong>."
      format.html { redirect_to(experimenter_labs_url) }
    end
  end
  def lab_params
    params.require(:lab).permit(:name, :web_site, :country, :id)
  end
end
