class ApplicationJob < ActiveJob::Base

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
