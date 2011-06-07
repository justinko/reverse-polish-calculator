require 'spec_helper'

describe 'simple arithmetic' do
  
  describe 'addition' do
    describe '2 2 +' do
      context 'on separate lines' do
        it 'aggregates to 4.0' do    
          start
          type '2'
          type '2'
          type '+'
          type 'q'
      
          assert_exact_output <<-OUTPUT.rpc
            stack: 2.0
            aggregate: 0

            stack: 2.0, 2.0
            aggregate: 0

            calculated: 2.0 + 2.0
            stack: 
            aggregate: 4.0

          OUTPUT
        end
      end
    
      context 'on one line' do
        it 'aggregates to 4.0' do    
          start
          type '2 2 +'
          type 'q'
      
          assert_exact_output <<-OUTPUT.rpc
            calculated: 2.0 + 2.0
            stack: 
            aggregate: 4.0

          OUTPUT
        end
      end
    end
  end
  
  describe 'subtraction' do
    describe '4 2 -' do
      context 'on seperate lines' do
        it 'aggregates to 2.0' do    
          start
          type '4'
          type '2'
          type '-'
          type 'q'
      
          assert_exact_output <<-OUTPUT.rpc
            stack: 4.0
            aggregate: 0

            stack: 4.0, 2.0
            aggregate: 0

            calculated: 4.0 - 2.0
            stack: 
            aggregate: 2.0

          OUTPUT
        end
      end
    
      context 'on one line' do
        it 'aggregates to 2.0' do    
          start
          type '4 2 -'
          type 'q'
      
          assert_exact_output <<-OUTPUT.rpc
            calculated: 4.0 - 2.0
            stack: 
            aggregate: 2.0

          OUTPUT
        end
      end
    end
  end
  
  describe 'multiplication' do
    describe '3 2 *' do
      context 'on seperate lines' do
        it 'aggregates to 6.0' do    
          start
          type '3'
          type '2'
          type '*'
          type 'q'
      
          assert_exact_output <<-OUTPUT.rpc
            stack: 3.0
            aggregate: 0

            stack: 3.0, 2.0
            aggregate: 0

            calculated: 3.0 * 2.0
            stack: 
            aggregate: 6.0

          OUTPUT
        end
      end
    
      context 'on one line' do
        it 'aggregates to 6.0' do    
          start
          type '3 2 *'
          type 'q'
      
          assert_exact_output <<-OUTPUT.rpc
            calculated: 3.0 * 2.0
            stack: 
            aggregate: 6.0

          OUTPUT
        end
      end
    end
  end
  
  describe 'division' do
    describe '10 2 /' do
      context 'on seperate lines' do
        it 'aggregates to 5.0' do    
          start
          type '10'
          type '2'
          type '/'
          type 'q'
      
          assert_exact_output <<-OUTPUT.rpc
            stack: 10.0
            aggregate: 0

            stack: 10.0, 2.0
            aggregate: 0

            calculated: 10.0 / 2.0
            stack: 
            aggregate: 5.0

          OUTPUT
        end
      end
    
      context 'on one line' do
        it 'aggregates to 5.0' do    
          start
          type '10 2 /'
          type 'q'
      
          assert_exact_output <<-OUTPUT.rpc
            calculated: 10.0 / 2.0
            stack: 
            aggregate: 5.0

          OUTPUT
        end
      end
    end
  end
  
end