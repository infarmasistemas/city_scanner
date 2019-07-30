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
end
