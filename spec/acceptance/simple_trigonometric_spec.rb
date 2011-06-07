require 'spec_helper'

describe 'simple trigonometric' do
  
  describe 'acos' do
    describe 'given -1' do
      it 'returns 3.141592653589793' do    
        start
        type '-1'
        type 'acos'
        type 'q'
    
        assert_exact_output <<-OUTPUT.rpc
          stack: -1.0
          aggregate: 0

          calculated: acos(-1.0)
          stack: 
          aggregate: 3.141592653589793

        OUTPUT
      end
    end
  end
  
  describe 'asin' do
    describe 'given -1' do
      it 'returns -1.5707963267948966' do    
        start
        type '-1'
        type 'asin'
        type 'q'
    
        assert_exact_output <<-OUTPUT.rpc
          stack: -1.0
          aggregate: 0

          calculated: asin(-1.0)
          stack: 
          aggregate: -1.5707963267948966

        OUTPUT
      end
    end
  end
  
  describe 'cos' do
    describe 'given 1' do
      it 'returns 0.5403023058681398' do    
        start
        type '1'
        type 'cos'
        type 'q'
    
        assert_exact_output <<-OUTPUT.rpc
          stack: 1.0
          aggregate: 0

          calculated: cos(1.0)
          stack: 
          aggregate: 0.5403023058681398

        OUTPUT
      end
    end
  end
  
  describe 'tan' do
    describe 'given 1' do
      it 'returns 1.557407724654902' do    
        start
        type '1'
        type 'tan'
        type 'q'
    
        assert_exact_output <<-OUTPUT.rpc
          stack: 1.0
          aggregate: 0

          calculated: tan(1.0)
          stack: 
          aggregate: 1.557407724654902

        OUTPUT
      end
    end
  end
  
end