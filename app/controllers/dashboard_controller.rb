class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @resources = Resource.all
    @resources_up = Resource.up
    @resources_down = Resource.down
  end
end