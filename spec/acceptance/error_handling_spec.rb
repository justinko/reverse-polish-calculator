require 'spec_helper'

describe 'error handling' do
  
  describe "for an input that can't be calculated" do
    it 'provides a message' do
      start
      type 'foo'
      type '5'
      type '4'
      type '+'
      type 'q'
  
      assert_exact_output <<-OUTPUT.rpc
        Cannot calculate 'foo'

        stack: 5.0
        aggregate: 0
        
        stack: 5.0, 4.0
        aggregate: 0
        
        calculated: 5.0 + 4.0
        stack: 
        aggregate: 9.0

      OUTPUT
    end
  end
  
  describe 'for a trigonometric method' do
    context 'that is called with a non-computable value' do
      it 'provides a message' do
        start
        type '5'
        type 'acos'
        type 'q'
  
        assert_exact_output <<-OUTPUT.rpc
          stack: 5.0
          aggregate: 0
        
          Bad value for 'acos'

        OUTPUT
      end
    end
  end
  
end