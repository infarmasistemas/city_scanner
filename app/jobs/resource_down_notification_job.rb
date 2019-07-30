class ResourceDownNotificationJob < ApplicationJob
  queue_as :default

  def perform(resource_id)
    resource = Resource.find_by_id(resource_id)

    if resource
      body = {
          type: 'error',
          title: "Resource #{resource.id} is DOWN",
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
