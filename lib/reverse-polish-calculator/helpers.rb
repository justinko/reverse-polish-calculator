module ReversePolishCalculator
  module Helpers
    
    def self.multi_puts(*strings)
      return if $in_unit_spec_suite
      strings.each {|str| puts str }
      puts
    end
    
  end
end