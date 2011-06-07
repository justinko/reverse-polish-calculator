require 'spec_helper'

module ReversePolishCalculator
  describe Stack do
    
    describe '#add' do
      context 'given a single character' do
        before { subject.add('5') }
        
        it 'adds one input' do
          subject.should have(1).inputs
        end
      end
      
      context 'given 3 characters between spaces' do
        before { subject.add('1 2 3') }
        
        it 'adds 3 inputs' do
          subject.should have(3).inputs
        end
      end
    end
    
    describe '#remove' do
      context 'given an input value that exists in inputs' do
        before { subject.add('foo') }
        
        it 'removes the input' do
          expect do
            subject.remove('foo')
          end.to change(subject.inputs, :size).by(-1)
        end
      end
    end
    
    describe '#calculate' do        
      it 'aggregates' do
        subject.inputs << Input.new('2')
        subject.inputs << Input.new('2')
        subject.inputs << Input.new('+')
        
        subject.calculate
        subject.aggregate.should eq(4.0)
        
        subject.inputs << Input.new('2')
        subject.inputs << Input.new('2')
        subject.inputs << Input.new('+')
        
        subject.calculate
        subject.aggregate.should eq(8.0)
        
        subject.inputs << Input.new('2')
        subject.inputs << Input.new('-')
        
        subject.calculate
        subject.aggregate.should eq(6.0)
        
        subject.inputs << Input.new('2')
        subject.inputs << Input.new('*')
        
        subject.calculate
        subject.aggregate.should eq(12.0)
      end
    end
    
    describe '#output' do
      it 'calls .add on Output, twice' do
        Output.should_receive(:add).twice
        subject.output
      end
      
      it 'calls .display on Output' do
        Output.should_receive(:display)
        subject.output
      end
      
      it 'calls .clear on Output' do
        Output.should_receive(:clear)
        subject.output
      end
    end
    
    describe '#unswap' do
      context 'with inputs.swapped set to true' do
        before { subject.inputs.swapped = true }
        
        it 'sets inputs.swapped to false' do
          expect { subject.unswap }.to change {
            subject.inputs.swapped }.from(true).to(false)
        end
      end
    end
    
  end
end