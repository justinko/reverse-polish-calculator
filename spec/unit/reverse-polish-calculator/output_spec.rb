require 'spec_helper'

module ReversePolishCalculator
  describe Output do
    
    describe '.add' do
      context 'given "foo"' do
        it 'adds "foo" to the list of texts' do
          described_class.add('foo')
          described_class.texts.should include('foo')
        end
      end
    end
    
    describe '.texts' do
      it 'returns an array' do
        described_class.texts.should be_an_instance_of(Array)
      end
    end
    
    describe '.display' do
      before { described_class.clear }
      
      it 'calls Helpers.multi_puts with the list of texts' do
        described_class.add('foo')
        Helpers.should_receive(:multi_puts).with('foo')
        described_class.display
      end
    end
    
    describe '.clear' do
      it 'clears out the list of texts' do
        described_class.add('foo')
        described_class.clear
        described_class.texts.should be_empty
      end
    end
    
  end
end