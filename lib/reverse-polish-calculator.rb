require 'reverse-polish-calculator/helpers'
require 'reverse-polish-calculator/stack'
require 'reverse-polish-calculator/inputs'
require 'reverse-polish-calculator/input'
require 'reverse-polish-calculator/errors'
require 'reverse-polish-calculator/output'

module ReversePolishCalculator
  
  def self.start
    loop_with_error_handling do   
      stack.add(gets.chomp)
      stack.calculate
      stack.output
    end
  end
  
  def self.stack
    @stack ||= Stack.new
  end
  
  def self.loop_with_error_handling
    loop { yield }
  rescue *Errors::Classes => exception
    Errors.handle(exception)
    Output.clear
    stack.unswap
    retry
  end    
  
end