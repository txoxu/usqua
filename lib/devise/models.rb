# frozen_string_literal: true

# Devise::Models
# This module handles the configuration and inclusion of various Devise modules
# into user models, ensuring required attributes and methods are present.
module Devise
  # deviseモジュール
  module Models
    # MissingAttribute is raised when an attribute required by Devise is not present.
    class MissingAttribute < StandardError
      def initialize(attributes)
        super(attributes) # Initialize parent class
        @attributes = attributes
      end

      def message
        "The following attribute(s) is (are) missing on your model: #{@attributes.join(', ')}"
      end
    end

    # Configures the given Devise module with accessors and methods.
    def self.config(mod, *accessors) # :nodoc:
      class << mod; attr_accessor :available_configs; end
      mod.available_configs = accessors

      accessors.each do |accessor|
        create_accessors(mod, accessor)
      end
    end

    # Checks required fields for the specified class.
    def self.check_fields!(klass)
      failed_attributes = []
      instance = klass.new

      klass.devise_modules.each do |mod|
        constant = const_get(mod.to_s.classify)

        constant.required_fields(klass).each do |field|
          failed_attributes << field unless instance.respond_to?(field)
        end
      end

      raise_devise_error(failed_attributes) if failed_attributes.any?
    end

    # Includes the specified devise modules into the model.
    def devise(*modules)
      options = modules.extract_options!.dup
      selected_modules = sort_modules(modules)

      devise_modules_hook! do
        include_default_modules
        include_selected_modules(selected_modules, options)
        devise_modules(selected_modules)
        options(options)
      end
    end

    def include_default_modules
      include Devise::Orm
      include Devise::Models::Authenticatable
    end

    def include_selected_modules(selected_modules, options)
      selected_modules.each do |m|
        include_module(m, options)
      end
    end

    def devise_modules(selected_modules)
      self.devise_modules |= selected_modules
    end

    def options(options)
      options.each { |key, value| send(:"#{key}=", value) }
    end

    # Yields a block for extending ORM compatibility.
    def devise_modules_hook!
      yield
    end

    def self.create_getter(mod, accessor)
      mod.class_eval <<-GETTER, __FILE__, __LINE__ + 1
        def #{accessor}
          defined?(@#{accessor}) ? @#{accessor} : (superclass.respond_to?(:#{accessor}) ? superclass.#{accessor} : Devise.#{accessor})
        end
      GETTER
    end

    def self.create_setter(mod, accessor)
      mod.class_eval <<-SETTER, __FILE__, __LINE__ + 1
        def #{accessor}=(value)
          @#{accessor} = value
        end
      SETTER
    end

    def self.create_accessors(mod, accessor)
      create_getter(mod, accessor)
      create_setter(mod, accessor)
    end

    def self.raise_devise_error(failed_attributes)
      raise Devise::Models::MissingAttribute, failed_attributes
    end

    def self.sort_modules(modules)
      modules.map(&:to_sym).uniq.sort_by do |s|
        Devise::ALL.index(s) || -1 # follow Devise::ALL order
      end
    end

    def include_module(module_name, options)
      mod = Devise::Models.const_get(module_name.to_s.classify)

      if mod.const_defined?('ClassMethods')
        class_mod = mod.const_get('ClassMethods')
        extend class_mod

        set_module_configs(class_mod, options)
      end

      include mod
    end

    def set_module_configs(class_mod, options)
      return unless class_mod.respond_to?(:available_configs)

      available_configs = class_mod.available_configs
      available_configs.each do |config|
        next unless options.key?(config)

        send(:"#{config}=", options.delete(config))
      end
    end
  end
end

require 'devise/models/authenticatable'
