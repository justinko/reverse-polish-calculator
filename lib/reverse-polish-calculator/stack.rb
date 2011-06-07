module ReversePolishCalculator
  class Stack
        
    attr_reader :inputs, :aggregate
    
    def initialize
      @inputs, @aggregate = [].extend(Inputs), 0
    end
    
    def add(expression)
      expression.split.each do |value|
        @inputs << Input.new(value)
      end
    end
    
    def remove(input_value)
      @inputs.delete_if do |input|
        input.value == input_value.to_s
      end
    end
    
    def calculate
      @aggregate = @inputs.calculate(aggregate)
    end
    
    def output
      Output.add "stack: #{@inputs.inspect}"
      Output.add "aggregate: #{@aggregate}"
      Output.display
      Output.clear
    end
    
    def unswap
      inputs.swapped = false
    end
    
  end
end