class Resource < ApplicationRecord
  require 'httparty'
  after_create_commit :calculate_next_execution
  belongs_to :user
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
    update(status: 'up')
  end

  def set_status_as_down
    update(status: 'down')
  end

  def check_resource
    puts "Checking resource: #{url}"
    begin
      response = HTTParty.get(url)
      case response.code
      when 200
        set_status_as_up
      else
        set_status_as_down
      end
    rescue Exception => e
      puts 'Exception is here'
      set_status_as_down
    end

    calculate_next_execution
  end

end
