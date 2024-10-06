# frozen_string_literal: true

# Devise::Models::Rememberable
# This module provides methods for remembering a user through cookies,
# including token management and serialization.
require 'devise/strategies/rememberable'
require 'devise/hooks/rememberable'
require 'devise/hooks/forgetable'

# deviseモジュール
module Devise
  # models
  module Models
    # rememberable
    module Rememberable
      extend ActiveSupport::Concern

      attr_accessor :remember_me

      # Required fields for rememberable module
      def self.required_fields(_klass)
        [:remember_created_at]
      end

      # Remember the user by creating a token and saving the timestamp
      def remember_me!
        set_remember_token
        self.remember_created_at ||= Time.now.utc
        save(validate: false) if changed?
      end

      # Forget the user by clearing the remember token
      def forget_me!
        return unless persisted?

        clear_remember_token
        save(validate: false)
      end

      def remember_expires_at
        self.class.remember_for.from_now
      end

      def extend_remember_period
        self.class.extend_remember_period
      end

      def rememberable_value
        validate_rememberable_value
      end

      def rememberable_options
        self.class.rememberable_options
      end

      def after_remembered; end

      def remember_me?(token, generated_at)
        generated_at = time_from_json(generated_at) if generated_at.is_a?(String)

        valid_remember_me?(token, generated_at)
      end

      private

      def set_remember_token
        self.remember_token ||= self.class.remember_token if respond_to?(:remember_token)
      end

      def clear_remember_token
        self.remember_token = nil if respond_to?(:remember_token)
        self.remember_created_at = nil if self.class.expire_all_remember_me_on_sign_out
      end

      def validate_rememberable_value
        if respond_to?(:remember_token)
          remember_token
        elsif respond_to?(:authenticatable_salt) && (salt = authenticatable_salt.presence)
          salt
        else
          raise "authenticatable_salt returned nil for #{self.class.name}. " \
                'Ensure a password is set or implement custom logic.'
        end
      end

      def valid_remember_me?(token, generated_at)
        generated_at.is_a?(Time) &&
          (self.class.remember_for.ago < generated_at) &&
          (generated_at > (remember_created_at || Time.zone.now).utc) &&
          Devise.secure_compare(rememberable_value, token)
      end

      def time_from_json(value)
        if value =~ /\A\d+\.\d+\Z/
          Time.zone.at(value.to_f)
        else
          begin
            Time.zone.parse(value)
          rescue StandardError
            nil
          end
        end
      end

      module ClassMethods
        def serialize_into_cookie(record)
          [record.to_key, record.rememberable_value, Time.now.utc.to_f.to_s]
        end

        def serialize_from_cookie(*args)
          id, token, generated_at = *args

          record = to_adapter.get(id)
          record if record&.remember_me?(token, generated_at)
        end

        def remember_token # :nodoc:
          loop do
            token = Devise.friendly_token
            break token unless to_adapter.find_first({ remember_token: token })
          end
        end

        Devise::Models.config(self, :remember_for, :extend_remember_period, :rememberable_options,
                              :expire_all_remember_me_on_sign_out)
      end
    end
  end
end
