module BootstrapValidatorRails
  module Validators
    class Presence < Validator
      def generate_data
        data = {}
        return data if unsupported?

        data[:bv_notempty] = 'true'
        data[:bv_notempty_message] = generate_message
        data
      end

      def generate_message
        @record.errors.generate_message(@method, :blank, default: "can't be blank")
      end
    end
  end
end
