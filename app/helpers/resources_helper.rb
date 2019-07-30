module ResourcesHelper
  def class_by_resource_status(resource_status)
    case resource_status.status
    when 'up'
      return 'status-p bg-success'
    when 'down'
      return 'status-p bg-danger'
    else
      return 'status-p bg-info'
    end
  end
end
