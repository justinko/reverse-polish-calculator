require 'spec_helper'

describe ReversePolishCalculator do
  
  describe '.start' do
    it 'starts the loop' do
      described_class.should_receive(:loop)
      described_class.start
    end
  end
  
  describe '.stack' do
    it 'returns an instance of Stack' do
      described_class.stack.should be_an_instance_of(described_class::Stack)
    end
  end
  
end