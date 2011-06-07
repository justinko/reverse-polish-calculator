module ReversePolishCalculator
  module Output
        
    def self.add(str)
      texts.push(str)
    end
    
    def self.texts
      @texts ||= []
    end
    
    def self.display
      Helpers.multi_puts(*texts)
    end
    
    def self.clear
      texts.clear
    end
      
  end
end