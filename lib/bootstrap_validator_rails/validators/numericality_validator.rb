module BootstrapValidatorRails
  module Validators
    class Numericality 
      def initialize(record, method, validator)
        @record, @method, @validator = record, method, validator
      end

      def generate_data
        data = {
          :bv_numeric_separator => '',
          :bv_numeric_separator_message => generate_message
        }
        
        data.merge(generate_options)
      end

      def generate_message
        @record.errors.generate_message(@method, :presence, {default: 'should be a number'})
      end

      def generate_options
        options = @validator.options

        data = {}

        if options[:greater_than].present?
          data[:bv_greaterthan_inclusive] = 'false'
          data[:bv_greaterthan_value] = options[:greater_than]
        end

        if options[:greater_than_or_equal_to].present?
          data[:bv_greaterthan_inclusive] = 'true'
          data[:bv_greaterthan_value] = options[:greater_than_or_equal_to]
        end

        if options[:less_than].present?
          data[:bv_lessthan_inclusive] = 'false'
          data[:bv_lessthan_value] = options[:less_than]
        end

        if options[:less_than_or_equal_to].present?
          data[:bv_lessthan_inclusive] = 'true'
          data[:bv_lessthan_value] = options[:less_than_or_equal_to]
        end
        data
      end
    end
  end
end