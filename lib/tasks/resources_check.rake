desc 'Checking resources'
task resources_check: :environment do
  puts "#{DateTime.now} - Checking Resources."

  Resource.all.each do |resource|
    current_time = DateTime.now

    if current_time > resource.next_execution
      resource.check_resource
    end
  end
  puts "#{DateTime.now} - Resources CHECKED"
end