class LabController < ApplicationController
  def land
    @lab = Lab.find(params[:id])
  end
end