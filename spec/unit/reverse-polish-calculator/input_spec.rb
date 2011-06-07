require 'spec_helper'

module ReversePolishCalculator
  describe Input do
        
    describe '#exited?' do
      let(:input) { described_class.allocate }
      
      context 'with input value of "q"' do
        it 'returns true' do
          input.instance_variable_set('@value', 'q')
          input.should be_exited
        end
      end
      
      context 'with input value of "Q"' do
        it 'returns true' do
          input.instance_variable_set('@value', 'Q')
          input.should be_exited
        end
      end
      
      context 'with input value of "foo"' do
        it 'returns false' do
          input.instance_variable_set('@value', 'foo')
          input.should_not be_exited
        end
      end
    end
    
    describe '#invoke' do
      context 'with input value of "+"' do
        let(:input) { described_class.new('+') }
        
        context 'given 2 inputs that have a value of "2"' do
          let(:input_1) { described_class.new('2') }
          let(:input_2) { described_class.new('2') }
          
          it 'returns 4.0' do
            input.invoke(input_1, input_2).should eq(4.0)
          end
        end
      end
      
      context 'with input value of "acos"' do
        let(:input) { described_class.new('acos') }
        
        context 'given 1 input with a value of "-1"' do
          let(:input_1) { described_class.new('-1') }
          
          it 'returns 3.141592653589793' do
            input.invoke(input_1).should eq(3.141592653589793)
          end
        end
      end
    end
    
    describe '#math_method?' do
      context 'with input value of "acos"' do
        it 'returns true' do
          described_class.new('acos').should be_math_method
        end
      end
      
      context 'with input value of "foo"' do
        it 'returns false' do
          described_class.new('foo').should_not be_math_method
        end
      end
    end
    
    describe '#operand?' do
      context 'with input value of "5"' do
        it 'returns true' do
          described_class.new('5').should be_operand
        end
      end
      
      context 'with input value of "foo"' do
        it 'returns false' do
          described_class.new('foo').should_not be_operand
        end
      end
    end
    
    describe '#to_f' do
      context 'with input value of "5"' do
        it 'returns 5.0' do
          described_class.new('5').to_f.should eq(5.0)
        end
      end
    end
    
  end
end