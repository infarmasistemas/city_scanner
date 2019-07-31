class ResourcesMailer < ApplicationMailer
  def resource_up_mail(resource)
    @resource = resource

    @resource.user.contacts.each do |contact|
      mail(to: contact.address,
           subject: "Resource is back up - #{@resource.id}")
    end
  end

  def resource_down_mail(resource)
    @resource = resource

    @resource.user.contacts.each do |contact|
      mail(to: contact.address,
           subject: "Resource is DOWN - #{@resource.id}")
    end
  end
end
