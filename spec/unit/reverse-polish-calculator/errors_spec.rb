require 'spec_helper'

module ReversePolishCalculator
  describe Errors do
    
    describe '.handle' do
      context 'given a NoMethodError exception' do
        let(:exception) { NoMethodError.new }
        
        it 'calls .no_method_error' do
          described_class.should_receive(:no_method_error).with(exception)
          described_class.handle(exception)
        end
      end
    end
    
    describe '.no_method_error' do
      context 'given a NoMethodError exception' do
        let(:exception) { NoMethodError.new('message', 'name') }
        
        it 'removes the offending input from the stack' do
          ReversePolishCalculator.stack.should_receive(:remove).with('name')
          described_class.no_method_error(exception)
        end
      end
    end
    
    describe '.math_domain_error' do
      context 'given a Math::DomainError exception' do
        let(:exception) { Math::DomainError.new('the "name"') }
        
        it 'removes the offending input from the stack' do
          ReversePolishCalculator.stack.should_receive(:remove).with('name')
          described_class.math_domain_error(exception)
        end
      end
    end
    
  end
end