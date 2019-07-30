class UpdatePagesJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    # Notifying administrators
    # User.all.each do |administrator|
    user = User.find_by_id(user_id)

    if user
      send_websocket_notification("websocket_channel-#{user.id}",
                                  'update_pages',
                                  '')
    end
  end
end
