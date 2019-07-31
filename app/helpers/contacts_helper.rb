module ContactsHelper
  def class_by_contact_status(mail)
    case mail.status
    when 'active'
      return 'status-p bg-success'
    when 'inactive'
      return 'status-p bg-danger'
    else
      return 'status-p bg-info'
    end
  end
end
