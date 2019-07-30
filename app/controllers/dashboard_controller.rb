class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @resources = Resource.all[0..9]
    @resources_up = Resource.up
    @resources_down = Resource.down
    @logs = Log.all.order(id: :desc)[0..9]
  end
end
