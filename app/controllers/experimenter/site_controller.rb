class Experimenter::SiteController < ApplicationController
  before_action :authenticate_experimenter!

  def dashboard
    if current_experimenter.administrator
      @labs = Lab.where('')
      @studies = Study.where('')
      @experimenters = Experimenter.where('')
    else
      @studies = current_experimenter.lab.studies
      @experimenters = current_experimenter.lab.experimenters
    end
  end

  def shared_data
    @participants_with_currently_shared_data = Participant.with_currently_shared_data
    if params[:table]
      @table = params[:table]
    else
      @table = 'spatial-ability-and-demographics'
    end
  end
end
