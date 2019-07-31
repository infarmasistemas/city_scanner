class DashboardController < ApplicationController
  authorize_resource class: false

  def index
    @resources = Resource.all
                     .accessible_by(current_ability)
                     .order(created_at: :desc)[0..9]
    @resources_up = Resource.accessible_by(current_ability)
                        .up

    @resources_down = Resource.accessible_by(current_ability)
                          .down

    @logs = Log.all
                .accessible_by(current_ability)
                .order(id: :desc)
  end
end
