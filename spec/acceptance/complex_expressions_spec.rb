require 'spec_helper'

describe 'complex expressions' do
  
  describe '5 1 2 + 4 * + 3 - 2 / cos' do
    context 'on one line' do
      it 'aggregates to 7.0' do 
        start
        type '5 1 2 + 4 * + 3 - 2 / cos'
        type 'q'
      
        assert_exact_output <<-OUTPUT.rpc
          calculated: 1.0 + 2.0
          calculated: 3.0 * 4.0
          calculated: 5.0 + 12.0
          calculated: 17.0 - 3.0
          calculated: 14.0 / 2.0
          calculated: cos(7.0)
          stack: 
          aggregate: 0.7539022543433046

        OUTPUT
      end
    end
    
    context 'on separate lines' do
      it 'aggregates to 10.0' do 
        start
        type '5'
        type '1'
        type '2'
        type '+'
        type '4'
        type '*'
        type '+'
        type '3'
        type '-'
        type '2'
        type '/'
        type 'cos'
        type 'q'
      
        assert_exact_output <<-OUTPUT.rpc
          stack: 5.0
          aggregate: 0

          stack: 5.0, 1.0
          aggregate: 0

          stack: 5.0, 1.0, 2.0
          aggregate: 0

          calculated: 1.0 + 2.0
          stack: 5.0
          aggregate: 3.0

          stack: 5.0, 4.0
          aggregate: 3.0

          calculated: 5.0 * 4.0
          stack: 
          aggregate: 23.0

          calculated: 23.0 + 0.0
          stack: 
          aggregate: 23.0

          stack: 3.0
          aggregate: 23.0

          calculated: 23.0 - 3.0
          stack: 
          aggregate: 20.0
          
          stack: 2.0
          aggregate: 20.0
          
          calculated: 20.0 / 2.0
          stack: 
          aggregate: 10.0
          
          calculated: cos(10.0)
          stack: 
          aggregate: -0.8390715290764524

        OUTPUT
      end
    end
  end
  
end