require 'rake'

desc 'Import encounters from a text file'
task :import, [:file] => :environment do |t, args|
  unless File.exists? args[:file]
    puts 'Invalid file'
    return
  end
  card_count = 0

  # Load the requested file
  file = File.open(args[:file])
  lines = file.read.split("\n")

  # Find the location
  location_name = args[:file].match(/([^\/]+)\....$/)[1].gsub(/-/, ' ')
  location = Location.find_by_name(location_name)
  if location.nil?
    puts "Unable to locate Location with name: #{location_name}"
    return
  end

  # Process each line
  lines.each do |line|
    text, skill_check_str, expansion = line.split("\t").map &:strip
    skill_checks = skill_check_str.try(:scan,/[^\d]*\d/) || []

    puts text.try(:green)

    skill_checks.each do |skill_check|
      skill_type, skill_mod = skill_check.try(:split," ") || []
      puts "#{skill_type}(#{skill_mod})".blue unless skill_type.blank?
    end
    puts expansion.try(:yellow)
    print '.'
    puts
  end

  puts "\n#{lines.count} encounters imported for #{location.name}"
end
