module ReversePolishCalculator
  module Inputs
    
    attr_accessor :swapped
    
    def calculate(aggregate = 0)
      @operands, @trash = [], []
      @aggregate = aggregate
      
      each do |input|        
        if input.operand?
          add_operand(input)
        elsif input.math_method?
          invoke_math_method(input)
        else          
          invoke_binary_operator(input)
        end
      end
      
      empty_trash
      calculation
    end
    
    def add_operand(input)
      @operands << input
      @calculated = false
    end
    
    def invoke_math_method(input)
      operand = @operands.pop || @aggregate
      @operands.push input.invoke(operand)
      @trash << input << operand
      @calculated = true
    end
    
    def invoke_binary_operator(input)
      operand_1 = @operands.pop
      operand_2 = @operands.pop
      
      unless operand_2
        self.swapped = true
        operand_2 = operand_1
        operand_1 = @aggregate
      end

      @operands.push(if @swapped
        input.invoke(operand_1, operand_2)
      else
        input.invoke(operand_2, operand_1)
      end)
      
      @trash << input << operand_1 << operand_2
      @calculated = true
    end
    
    def calculation
      if @calculated
        if swapped
          @operands.first
        else
          @aggregate + @operands.last.to_f
        end
      else
        @aggregate
      end
    end
    
    def empty_trash
      delete_if {|input| @trash.include?(input) }
    end
    
    def inspect
      map(&:to_f).join(', ')
    end
    
  end
end