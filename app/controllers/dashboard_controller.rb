class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @resources = Resource.all.order(created_at: :desc)[0..9]
    @resources_up = Resource.up
    @resources_down = Resource.down
    @logs = Log.all.order(id: :desc)
  end
end
