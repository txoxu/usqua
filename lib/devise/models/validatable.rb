# frozen_string_literal: true

module Devise
  module Models
    # Validatable creates all needed validations for a user email and password.
    # It's optional, given you may want to create the validations by yourself.
    # Automatically validate if the email is present, unique and its format is
    # valid. Also tests presence of password, confirmation and length.
    #
    # == Options
    #
    # Validatable adds the following options to +devise+:
    #
    #   * +email_regexp+: the regular expression used to validate e-mails;
    #   * +password_length+: a range expressing password length. Defaults to 6..128.
    #
    # Since +password_length+ is applied in a proc within `validates_length_of` it can be overridden
    # at runtime.
    module Validatable
      # All validations used by this module.
      VALIDATIONS = %i[validates_presence_of validates_uniqueness_of validates_format_of
                       validates_confirmation_of validates_length_of].freeze

      def self.required_fields(_klass)
        []
      end

      def self.included(base)
        base.extend ClassMethods
        assert_validations_api!(base)

        base.class_eval do
          validates_presence_of   :email, if: :email_required?
          validates_uniqueness_of :email, allow_blank: true, case_sensitive: true,
                                          if: :devise_will_save_change_to_email?
          validates_format_of     :email, with: email_regexp, allow_blank: true, if: :devise_will_save_change_to_email?

          validates_presence_of     :password, if: :password_required?
          validates_confirmation_of :password, if: :password_required?
          validates_length_of       :password, minimum: proc { password_length.min }, maximum: proc {
                                                                                                 password_length.max
                                                                                               }, allow_blank: true
        end
      end

      def self.assert_validations_api!(base) # :nodoc:
        unavailable_validations = VALIDATIONS.reject { |v| base.respond_to?(v) }

        return if unavailable_validations.empty?

        raise "Could not use :validatable module since #{base} does not respond " \
              "to the following methods: #{unavailable_validations.to_sentence}."
      end

      protected

      # Checks whether a password is needed or not. For validations only.
      # Passwords are always required if it's a new record, or if the password
      # or confirmation are being set somewhere.
      def password_required?
        !persisted? || !password.nil? || !password_confirmation.nil?
      end

      def email_required?
        true
      end

      module ClassMethods
        Devise::Models.config(self, :email_regexp, :password_length)
      end
    end
  end
end
