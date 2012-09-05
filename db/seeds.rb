# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'active_record/fixtures'
require 'randland/seed_factory'

seeds = Dir.glob(Rails.root.join('db/seeds/*')).map {|path| File.basename(path).gsub /\.yml/, ''}
seeds.each do |seed|
  ActiveRecord::Fixtures.create_fixtures(Rails.root.join('db/seeds'), seed)
end
