class SiteController < ApplicationController
  def land
  	@labs = Lab.all
  end
end