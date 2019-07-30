class Resource < ApplicationRecord
  require 'httparty'

  after_create_commit :calculate_next_execution

  belongs_to :user
  has_many :logs

  enum nature: ['hours', 'minutes']
  enum status: ['neutral', 'up', 'down']

  def calculate_next_execution
    case nature
    when 'hours'
      update(next_execution: DateTime.now + interval.hours)
    when 'minutes'
      update(next_execution: DateTime.now + interval.minutes)
    when 'seconds'
      update(next_execution: DateTime.now + interval.seconds)
    end
  end

  def set_status_as_up
    notification_resource_up
    update(status: 'up')
  end

  def set_status_as_down
    notification_resource_down
    update(status: 'down')
  end

  def check_resource
    puts "Checking resource: #{url}"
    begin
      response = HTTParty.get(url)
      case response.code
      when 200
        set_status_as_up
        create_log(response, nil)
      else
        set_status_as_down
        create_log(response, nil)
      end
    rescue Exception => e
      set_status_as_down
      create_log(nil, e)
    end

    calculate_next_execution
  end

  def create_log(response, exception)
    puts 'Creating log'
    if exception
      Log.create(resource: self,
                 response_code: nil,
                 response_body: nil,
                 exception: exception.to_s)
    else
      Log.create(resource: self,
                 response_code: response.code,
                 response_body: response.body,
                 exception: nil)
    end
  end

  def notification_resource_down
    puts 'Resource is DOWN'
    ResourceDownNotificationJob.perform_later(id)
  end

  def notification_resource_up
    ResourceDownNotificationJob.perform_later(id) if status == 'down'
  end

end
