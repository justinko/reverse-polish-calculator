module ReversePolishCalculator
  class Input
    
    attr_reader :value
    
    def initialize(value)
      @value = value
      exit if exited?
    end
    
    def exited?
      value.downcase == 'q'
    end
    
    def invoke(input_1, input_2 = nil)
      if math_method?
        Output.add "calculated: #{value}(#{input_1.to_f})"
        Math.send(value, input_1.to_f)
      else
        Output.add "calculated: #{input_1.to_f} #{value} #{input_2.to_f}"
        input_1.to_f.send(value, input_2.to_f)
      end
    end
    
    def math_method?
      Math.respond_to?(value)
    end
    
    def operand?
      !!value[/\d/]
    end
    
    def to_f
      value.to_f
    end
    
  end
end