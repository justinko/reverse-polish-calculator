module ReversePolishCalculator
  module Errors
        
    MethodMapping = {
      NoMethodError => :no_method_error,
      Math::DomainError => :math_domain_error
    }
    
    Classes = MethodMapping.keys
    
    def self.handle(exception)
      send(MethodMapping[exception.class], exception)
    end
    
    def self.no_method_error(exception)
      ReversePolishCalculator.stack.remove(exception.name)
      Helpers.multi_puts "Cannot calculate '#{exception.name}'"
    end
    
    def self.math_domain_error(exception)
      name = exception.message.match(/"(.+)"/)[1]
      ReversePolishCalculator.stack.remove(name)
      Helpers.multi_puts "Bad value for '#{name}'"
    end
    
  end
end