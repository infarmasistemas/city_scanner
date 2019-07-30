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
end
