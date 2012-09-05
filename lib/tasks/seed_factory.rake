require 'randland/seed_factory'

namespace :db do
  namespace :seed do
    desc 'replace seed data with a fresh dump from the database'
    task dump: :environment do
      Randland::SeedFactory.dump_all_fixtures!
    end
  end
end
