module Randland
  module SeedFactory
    extend ActiveSupport::Concern

    def generate_fixtures
      self.class_exec { define_method('factorized') { true } }
    end

    def self.dump_all_fixtures!
      factorized_fixtures.each &:dump_fixtures!
    end

    def self.factorized_fixtures
      Module.constants.map {|constant| eval constant.to_s}.select do |constant|
        not constant.nil? and
          constant.is_a? Class and
          constant.superclass == ActiveRecord::Base and
          constant.instance_methods(false).include? :factorized
      end
    end

    module ClassMethods

      def to_fixtures
        Hash[self.all.sort_by(&:factory_name).map { |obj| [obj.factory_name, obj.factory_attributes] }].to_yaml
      end

      def dump_fixtures!
        filename = Rails.root.join "db/seeds/#{self.name.underscore.pluralize.parameterize}.yml"
        File.open(filename, 'w') {|f| f.write(self.to_fixtures) }
      end

    end

    def factory_name
      name = self.try(:name) ||
        self.try(:title) ||
        "#{self.class.name} #{self.id}"
      name = name.parameterize
    end

    def factory_attributes
      ids, attrs = self.attributes.reject {|k, v| k == 'id'}.partition {|k, v| k =~ /_id$/}
      attrs = Hash[attrs]
      assocs = ids.map do |k, v|
        assoc_class = k.sub(/_id$/, '')
        [assoc_class, self.send(assoc_class).try(:factory_name)]
      end
      attrs.merge Hash[assocs]
    end

  end
end

ActiveRecord::Base.send :extend, Randland::SeedFactory
ActiveRecord::Base.send :include, Randland::SeedFactory
