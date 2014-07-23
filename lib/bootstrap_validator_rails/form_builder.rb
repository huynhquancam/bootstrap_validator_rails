require 'bootstrap_form'

module BootstrapValidatorRails
  class FormBuilder < BootstrapForm::FormBuilder
    def validators_of(method)
      object.class.validators_on(method)
    end
    
    def generate_validation_message(method, type)
      object.errors.generate_message(method, type, default: "is invalid")
    end

    def text_field(method, options = {})
      validators = validators_of(method)
      validator_messages = {}
      validators.each do |validator|
        if validator.kind == :presence
          validator_messages[:mv_notempty] = '' 
          validator_messages[:mv_notempty_message] = generate_validation_message(method, validator.kind)
        elsif validator.kind == :numericality
          validator_messages[:mv_numeric_separator] = '' 
          validator_messages[:mv_numeric_separator_message] = generate_validation_message(method, validator.kind)
        end
      end
      options[:data] = {}
      options[:data] = options[:data].merge(validator_messages)
      super
    end
  end
end