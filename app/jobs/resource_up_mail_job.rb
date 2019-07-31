class ResourceUpMailJob < ApplicationJob
  queue_as :default

  def perform(resource_id)
    resource = Resource.find_by_id(resource_id)

    if resource
      ResourcesMailer.resource_up_mail(resource).deliver
    end
  end
end
