require 'rspec'
require './base_decorator'

describe BaseDecorator do
  let(:nameable) { double('Nameable', correct_name: 'take name') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'should return the correct name of the nameable object' do
      expect(subject.correct_name).to eq('take name')
    end
  end
end
