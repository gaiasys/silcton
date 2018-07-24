class Experimenter::VirtualNavigationLogsController < ApplicationController
  before_action :authenticate_experimenter!

  def show
    @virtual_navigation_log = VirtualNavigationLog.find(params[:id])
    render :text => @virtual_navigation_log.log
  end
end
