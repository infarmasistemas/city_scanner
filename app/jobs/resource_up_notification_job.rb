class ResourceUpNotificationJob < ApplicationJob
  queue_as :default

  def perform(resource_id)
    resource = Resource.find_by_id(resource_id)

    if resource
      body = {
          type: 'success',
          title: "Resource #{resource.id} is back UP",
          content: "<br> URL: #{resource.url}"
      }

      send_websocket_notification("websocket_channel-#{resource.user.id}", 'notification', body)
    end
  end

  private

  def send_websocket_notification(server, type, body)
    # Adding a guard clause so that notifications aren't
    # sent during test execution
    return false if Rails.env.test?

    ActionCable.server.broadcast server,
                                 type: type.to_s,
                                 body: body
  end
end
